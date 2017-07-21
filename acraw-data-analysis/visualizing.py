import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.axes_grid.anchored_artists import AnchoredText


verify_data = True

class VisualizeAC:
    def __init__(self):
        self.csv_deploy_info = "deploy.info.csv"
        self.csv_host_cpu_util = "HOST_CPU_USER.csv"
        self.csv_ac_flow = "se_basa_ac_basa_ac_flow_cnt.csv"
        self.csv_tm_avg = "se_basa_ac_basa_ac_tm_avg.csv"
        self.csv_cpu_util_sys = "HOST_CPU_SYS.csv"
        self.csv_cpu_util_user = "HOST_CPU_USER.csv"
        self.dic_caption = dict()
        # Assign index to CPU type. 0 -> 2637v2, 1 -> 2637v3, 2 -> 2640v3
        self.dic_host_type = dict()
        self.dic_host_namespace = dict()
        self.dic_host_instance = dict()
        self.data_items = []
        self.data_utils = dict()
        self.data_flow = dict()
        self.data_tm = dict()
        self.pltpic = 1
        self.utime_base = 0
        self.data_sys_user = dict()

    def parse_cpu_util_sys_user(self):
        file = open(self.csv_cpu_util_sys)
        cpu_util_sys = map(lambda x: x.strip().split(','), file.readlines())[1:]
        file.close()
        file = open(self.csv_cpu_util_user)
        cpu_util_user = map(lambda x: x.strip().split(','), file.readlines())[1:]
        file.close()

        host_util_sys = map(lambda x: x[0], cpu_util_sys)
        host_util_user = map(lambda x: x[0], cpu_util_user)
        host_common = list(set(host_util_sys).intersection(set(host_util_user)))
        host_util_sys = sorted(filter(lambda x: x[0] in host_common, cpu_util_sys))
        host_util_user = sorted(filter(lambda x: x[0] in host_common, cpu_util_user))
        util_sys = dict()
        for util_t in host_util_sys:
            if util_t[0] not in util_sys:
                util_sys[util_t[0]] = [(self.time_to_minutes(util_t[1]), util_t[2])]
            else:
                util_sys[util_t[0]] += [(self.time_to_minutes(util_t[1]), util_t[2])]
        util_user = dict()
        for util_t in host_util_user:
            if util_t[0] not in util_user:
                util_user[util_t[0]] = [(self.time_to_minutes(util_t[1]), util_t[2])]
            else:
                util_user[util_t[0]] += [(self.time_to_minutes(util_t[1]), util_t[2])]

        for host in util_sys:
            tu = []
            dict_ts = dict(util_sys[host])
            dict_tu = dict(util_user[host])
            for t in dict_ts:
                if t in dict_tu:
                    tu += [(t,float(dict_ts[t])+float(dict_tu[t]))]
            self.data_sys_user[self.host_to_instance(host)] = tu

    def parse_deploy_info(self):
        info_file = open(self.csv_deploy_info)
        data_items = map(lambda x: x.strip().split(','), info_file.readlines())
        info_file.close()
        caption = data_items[0]
        # ['IP', 'HOSTNAME', 'CPU_HT_ENABLED', 'CPU_PHYSICAL_CPU', 'CPU_PHYSICAL_CORES', 'CPU_LOGICAL_CORES',
        # 'CPU_MODEL_NAME', 'CPU_FREQUENCY', 'SYS_KERNEL_VERSION', 'SYS_OS_INFO', 'INSTANCE']
        for i in range(0, len(caption)):
            self.dic_caption[caption[i]] = i
        i = 0
        # ignore line 0
        for h in range(1, len(data_items)):
            # add index for hostname and namespace
            if data_items[h][self.dic_caption['CPU_MODEL_NAME']] not in self.dic_host_type:
                self.dic_host_type[data_items[h][self.dic_caption['CPU_MODEL_NAME']]] = i
                i += 1
        """
        One error made once in following statement
            data_items = map(lambda x: x.append(dic_host_type[x[dic_caption['CPU_MODEL_NAME']]]), data_items[1:])
        data_items returns an array with element of 'none'

        """
        data_items = map(lambda x: x+[(self.dic_host_type[x[self.dic_caption['CPU_MODEL_NAME']]])],
                         data_items[1:])
        self.dic_caption["CPU_TYPE_IN_NUM"] = len(self.dic_caption)
        self.data_items = sorted(data_items, key=lambda x: x[-1])
        for h in range(0, len(data_items)):
            # add index for hostname and namespace
            self.dic_host_namespace[self.data_items[h][self.dic_caption['HOSTNAME']]] = h
            self.dic_host_instance[self.data_items[h][self.dic_caption['INSTANCE']]] = h
        if verify_data:
            for instance in self.dic_host_instance:
                index = self.dic_host_instance[instance]
                if instance != self.data_items[index][self.dic_caption['INSTANCE']]:
                    print("Error, self.dic_host_instance and self.data_items are not match")

    def host_to_instance(self,host):
        pos_host = self.dic_caption["HOSTNAME"]
        pos_instance = self.dic_caption["INSTANCE"]

        index = [i for i, x in enumerate(self.data_items) if x[pos_host] == host]
        if len(index) :
            return self.data_items[index[0]][pos_instance]
        else:
            print ("Cannot find instance section for host %s"%host)
            return None

    def parse_cpu_utilization(self):
        util_info = open(self.csv_host_cpu_util)
        # namespace	timestamp	data
        data_items = map(lambda x: x.strip().split(','), util_info.readlines()[1:])
        util_info.close()
        for data in data_items:
            host = self.host_to_instance(data[0])
            if host not in self.data_utils:
                self.data_utils[host] = []
            self.data_utils[host] += [(self.time_to_seconds(data[1]), float(data[2]))]

    def draw_cpu_utils(self, from_sys_user=False):
        # A picture for all hosts
        local_pltpic = self.pltpic
        #
        # local picture id +0 : cpu utilization for all CPU
        # local picture id + 1 -> CPUs : individual type of CPU
        #
        sub_pic = local_pltpic + 1
        nodes_nun = 0
        sub_node_cnt = dict()
        colors = ['r','g','b','c','m']
        for cpu_model in self.dic_host_type:
            sub_node_cnt[cpu_model] = 0

        if from_sys_user:
            dict_source = self.data_sys_user
        else:
            dict_source = self.data_utils

        for host_cpu in dict_source:
            nodes_nun += 1
            plt.figure(self.pltpic)

            time_utils = sorted(dict_source[host_cpu])
            times = map(lambda x: x[0], time_utils)
            times = map(lambda x: (x - self.utime_base), times)  # Unit: minute
            utils = map(lambda x: x[1], time_utils)
            cpu_type_index = self.dic_caption["CPU_TYPE_IN_NUM"]
            cpu_model_name = self.data_items[self.dic_host_instance[host_cpu]][self.dic_caption["CPU_MODEL_NAME"]]
            cpu_type = self.data_items[self.dic_host_instance[host_cpu]][cpu_type_index]
            sub_node_cnt[cpu_model_name] += 1

            plt.plot(times, utils, colors[cpu_type])

            plt.figure(sub_pic + cpu_type)
            plt.plot(times, utils, colors[cpu_type])

        plt.figure(local_pltpic)
        plt.xlabel("Time (s)")
        plt.title('CPU Utilization (2637v2,2637v3,2640v4 - num:%d' % nodes_nun)
        for cpu_model in self.dic_host_type:
            plt.figure(sub_pic + self.dic_host_type[cpu_model])
            plt.title('CPU Utilization (%s - num:%d)'%(cpu_model,sub_node_cnt[cpu_model]))
            plt.xlabel("Time (s)")

        self.pltpic += (1 + len(self.dic_host_type))

        ''' Draw average CPU utilization'''
        dic_cpu_util = {k: {} for k in self.dic_host_type}

        '''
        When do statistic in minutes, that might have several tm data in one minute
        here, count data that in same time metric, later we'll average them
        '''
        for host_cpu in dict_source:
            cpu_model_name = self.data_items[self.dic_host_instance[host_cpu]][self.dic_caption["CPU_MODEL_NAME"]]
            sub_node_cnt[cpu_model_name] += 1

            times = map(lambda x: x[0], dict_source[host_cpu])
            utils = map(lambda x: x[1], dict_source[host_cpu])

            for i in range(0, len(times)):
                cpu_utils = dic_cpu_util[cpu_model_name]
                if times[i] not in cpu_utils:
                    cpu_utils[times[i]] = (1, utils[i])
                else:
                    count = cpu_utils[times[i]][0]
                    tm = cpu_utils[times[i]][1]
                    cpu_utils[times[i]] = (count + 1, tm + utils[i])

        for cpu_model_name in self.dic_host_type:
            cpu_utils = dic_cpu_util[cpu_model_name]
            cpu_utils = {k: cpu_utils[k] for k in cpu_utils}
            dic_cpu_util[cpu_model_name] = cpu_utils

        plt.figure(self.pltpic)
        max_y = 0
        for cpu_model in self.dic_host_type:
            cpu_utils = dic_cpu_util[cpu_model]
            times = sorted(cpu_utils)
            '''Average the data'''
            utils = [cpu_utils[times[i]][1] / cpu_utils[times[i]][0] for i in range(len(times))]
            t_min = min(times)
            times = map(lambda x: x - t_min, times)
            max_y = max(utils) if max_y < max(utils) else max_y
            plt.plot(times, utils, colors[self.dic_host_type[cpu_model]])
        for cpu_model in self.dic_host_type:
            cpu_type = self.dic_host_type[cpu_model]
            plt.text(0, max_y-2*cpu_type, cpu_model, color=colors[cpu_type], fontsize=8)
        if from_sys_user:
            source_text = "sys+usr"
        else:
            source_text = "UTIL"
        plt.title("Average CPU Utilization (%s)" % source_text)
        plt.xlabel("Time")
        self.pltpic += 1

    def draw_cpu_type(self):
        """
        Statistically draw host/ typesCPU
        :return:
        """
        local_pltpic = self.pltpic
        cpu_pos = self.dic_caption["CPU_TYPE_IN_NUM"]
        cpus = map(lambda x: x[cpu_pos], self.data_items)
        plt.figure(local_pltpic)
        cpu_ids = range(0, len(cpus))
        plt.plot(cpu_ids, cpus)
        self.pltpic += 1

    def parse_host_pressure(self):
        flow_file = open(self.csv_ac_flow)
        # namespace	timestamp	data
        data_items = map(lambda x: x.strip().split(','), flow_file.readlines()[1:])
        flow_file.close()
        for data in data_items:
            # if data[0] not in self.dic_host_namespace:
            #    print("%s is not in file %s"%(data[0], self.csv_deploy_inf))
            #    return
            if data[0] not in self.data_flow:
                self.data_flow[data[0]] = []
            if float(data[2]) == 0:
                # print ("Zero QPS found, host name:%s" % data[0])
                continue
            self.data_flow[data[0]] += [(self.time_to_seconds(data[1]), float(data[2]))]

        if verify_data:
            sum = 0
            for h in self.data_flow:
                for d in self.data_flow[h]:
                    sum += d[1]
            if long(sum) != long(26055901):
                print "Error in parse flow data"

    def draw_cpu_pressure(self):
        local_pltpic = self.pltpic
        sub_pic = local_pltpic + 1

        colors = ['r', 'g', 'b', 'c', 'm']

        sub_node_cnt = {k : 0 for k in self.dic_host_type}  # host count for each cpu model
        dic_cpu_qpspermin = {k : {} for k in self.dic_host_type}  # time specific queries for each CPU model

        for host_cpu in self.data_flow:
            cpu_type_index = self.dic_caption["CPU_TYPE_IN_NUM"]
            cpu_model_name = self.data_items[self.dic_host_instance[host_cpu]][self.dic_caption["CPU_MODEL_NAME"]]
            cpu_type = self.data_items[self.dic_host_instance[host_cpu]][cpu_type_index]

            time_flow = self.data_flow[host_cpu]
            # rebase the time in minutes
            times = map(lambda x: (x[0] - self.utime_base), time_flow)  # Unit: minute
            utils = map(lambda x: x[1], time_flow)

            # count hosts of different CPU model
            sub_node_cnt[cpu_model_name] += 1
            # count/sum queries for each timestamp
            for i in range(0, len(times)):
                cpu_qpspermin = dic_cpu_qpspermin[cpu_model_name]
                if times[i] not in cpu_qpspermin:
                    cpu_qpspermin[times[i]] = utils[i]
                else:
                    cpu_qpspermin[times[i]] += utils[i]

            # plot query-time for each host
            plt.figure(local_pltpic)
            plt.plot(times, utils, colors[cpu_type])

            plt.figure(sub_pic + cpu_type)
            plt.plot(times, utils, colors[cpu_type])

        plt.figure(local_pltpic)
        plt.xlabel("Time (s)")
        plt.title('QPM (2637v2,2637v3,2640v4')
        for cpu_model in self.dic_host_type:
            plt.figure(sub_pic + self.dic_host_type[cpu_model])
            plt.title('QPM (%s - num:%d)'%(cpu_model,sub_node_cnt[cpu_model]))
            plt.xlabel("Time (min)")
        self.pltpic += (1 + len(self.dic_host_type))

        # count average query for each CPU model
        for cpu_model in self.dic_host_type:
            cpu_qpspermin = dic_cpu_qpspermin[cpu_model]
            query_count = sum([cpu_qpspermin[k] for k in cpu_qpspermin])

            print("Cluster [%s(host=%d)] processed %d queries"
                  % (cpu_model, sub_node_cnt[cpu_model], query_count))

        plt.figure(self.pltpic)
        for cpumodel in self.dic_host_type:
            cpu_qpspermin = dic_cpu_qpspermin[cpumodel]
            for k in cpu_qpspermin:
                cpu_qpspermin[k] = cpu_qpspermin[k] / sub_node_cnt[cpumodel]
            times = [k for k in cpu_qpspermin]
            queries = [cpu_qpspermin[k] for k in cpu_qpspermin]
            plt.plot(times, queries, colors[self.dic_host_type[cpumodel]])

        plt.title("Average Query Count for Clusters")
        plt.xlabel("Time (min)")
        self.pltpic += 1

    def parse_host_tm(self):
        """
         - Parse ac-tm delay information from file -
        :return:
        """
        tm_file = open(self.csv_tm_avg)
        # instance	timestamp	data
        data_items = map(lambda x: x.strip().split(','), tm_file.readlines()[1:])
        tm_file.close()
        for data in data_items:
            if data[0] not in self.data_tm:
                # cpu type 'data[0]' not exists in dictionary of self.data_tm[cpu_type]
                # create a empty list for that host
                self.data_tm[data[0]] = []
            self.data_tm[data[0]] += [(self.time_to_seconds(data[1])/2, float(data[2]))]

        if verify_data:
            sum = 0.0
            for host in self.data_tm:
                data_array = self.data_tm[host]
                for data in data_array:
                    sum += data[1]
            if int(sum) != 48516118860:
                print("Error in parsing tm-ac data")
        """
        # average tm with same minute
        for host in self.data_tm:
            tm_array = self.data_tm[host]
            _tmdata={}
            for tm in tm_array:
                time = tm[0]
                if time not in _tmdata:
                    _tmdata[time] = (1, tm[1])
                else:
                    count = _tmdata[time][0]
                    value = _tmdata[time][1]
                    _tmdata[time]=(count+1,value+tm[1])

            self.data_tm[host] = [(t, _tmdata[t][1]/_tmdata[0]) for t in _tmdata]
        """

    def draw_cpu_tm(self):
        local_pltpic = self.pltpic
        sub_pic = local_pltpic + 1
        nodes_nun = 0
        sub_node_cnt = dict()
        colors = ['r', 'g', 'b', 'c', 'm']
        for cpu_model in self.dic_host_type:
            sub_node_cnt[cpu_model] = 0

        """
        dic_cpu_tmpermin data type
        {key_for_host : { K_for_time: [(occurrence, accumulated tm of total occurrence)]}}
        """
        dic_cpu_tmpermin = {k: {} for k in self.dic_host_type}

        for host_cpu in self.data_tm:
            nodes_nun += 1
            cpu_model_name = self.data_items[self.dic_host_instance[host_cpu]][self.dic_caption["CPU_MODEL_NAME"]]
            cpu_type = self.dic_host_type[cpu_model_name]
            sub_node_cnt[cpu_model_name] += 1

            time_tm = self.data_tm[host_cpu]
            times = map(lambda x: x[0], time_tm)
            utils = map(lambda x: x[1], time_tm)

            '''
            When do statistic in minutes, that might have several tm data in one minute
            here, count data that in same time metric, later we'll average them
            '''
            for i in range(0, len(times)):
                cpu_tmpermin = dic_cpu_tmpermin[cpu_model_name]
                if times[i] not in cpu_tmpermin:
                    cpu_tmpermin[times[i]] = (1, utils[i])
                else:
                    count = cpu_tmpermin[times[i]][0]
                    tm = cpu_tmpermin[times[i]][1]
                    cpu_tmpermin[times[i]] = (count+1, tm+utils[i])

        for cpu_model_name in self.dic_host_type:
            cpu_tmpermin = dic_cpu_tmpermin[cpu_model_name]
            cpu_tmpermin = {k: cpu_tmpermin[k] for k in sorted(cpu_tmpermin)}  # Arrange data by time (sorting...)
            dic_cpu_tmpermin[cpu_model_name] = cpu_tmpermin
        """
            plt.figure(local_pltpic)
            plt.plot(times, utils, colors[cpu_type])

            plt.figure(sub_pic + cpu_type)
           plt.plot(times, utils, colors[cpu_type])

        plt.figure(local_pltpic)
        plt.xlabel("Time (minutes)")
        plt.title('AC tm (2637v2,2637v3,2640v4 - num:%d' % nodes_nun)
        for cpu_model in self.dic_host_type:
            plt.figure(sub_pic + self.dic_host_type[cpu_model])
            plt.title('AC tm (%s - num:%d)' % (cpu_model, sub_node_cnt[cpu_model]))
            plt.xlabel("Time (minutes)")

        self.pltpic += (1 + len(self.dic_host_type))
        """
        plt.figure(self.pltpic)
        max_tms = 0
        for cpu_model in self.dic_host_type:
            cpu_tmpermin = dic_cpu_tmpermin[cpu_model]
            times = sorted(cpu_tmpermin)
            '''Average the data'''
            tms = [cpu_tmpermin[times[i]][1]/cpu_tmpermin[times[i]][0] for i in range(len(times))]

            t_min = min(times)
            times = map(lambda x: x-t_min, times)
            max_tms = max(tms) if max_tms < max(tms) else max_tms
            plt.plot(times, tms, colors[self.dic_host_type[cpu_model]])
        for cpu_model in self.dic_host_type:
            cpu_type = self.dic_host_type[cpu_model]
            plt.text(0, max_tms-13000*cpu_type, cpu_model, color=colors[cpu_type], fontsize=8)

        plt.title("Average tm for Clusters")
        plt.xlabel("Time")
        self.pltpic += 1
        """
        Draw data distribution figure with colorbar
        """
        tlables = []
        for host in self.data_tm:
            tm_per_host = self.data_tm[host]
            for k, v in tm_per_host:
                if k not in tlables:
                    tlables.append(k)
        tlables = sorted([long(x) for x in tlables])
        time_min = min(tlables)
        time_max = max(tlables)
        tlables = [x-time_min for x in tlables]
        times = {x:0 for x in tlables}
        for i in range(0, len(times)):
            t = times.keys()[i]
            times[t]=i

        host_index=len(self.data_items)
        time_index= len(times)
        npdata = np.zeros((host_index, time_index))
        host_index = 0
        v_max = 0.0
        v_min = 1111111111.0
        for i in range(0, len(self.data_items)):
            type = self.data_items[i][self.dic_caption['CPU_MODEL_NAME']]
            host = self.data_items[i][self.dic_caption['INSTANCE']]
            if host not in self.data_tm:
                continue
            tm_per_host = self.data_tm[host]
            for t, v in [(long(k)-time_min, v) for k, v in tm_per_host]:
                if t in times:
                    npdata[host_index][times[t]] = v

                    if v > v_max:
                        v_max = v
                    if v < v_min:
                        v_min = v
                    v_max = 4*v_min
            host_index += 1

        plt.figure(self.pltpic)
        cmap = plt.cm.winter

        im = plt.imshow(npdata, vmin=v_min, vmax=v_max, cmap=cmap)
        cbar = plt.colorbar(im, cmap=cmap, ticks=[v_min, v_max])
        self.pltpic += 1

    def time_to_minutes(self, timestamp):
        sec = self.time_to_seconds(timestamp)
        return sec/60

    def draw_unified_qps_cpu_utilization(self, from_sys_user=False):
        host_time_util_flow = dict()
        if from_sys_user:
            source_util = self.data_sys_user
        else:
            source_util = self.data_utils

        for host in source_util:
            if host in self.data_flow:
                time_util = source_util[host]
                time_flow = self.data_flow[host]
                time_u = map(lambda x: x[0], time_util)
                time_f = map(lambda x: x[0], time_flow)
                time_common = sorted(list(set(time_u).intersection(set(time_f))))
                dic_time_util = dict()
                for x in time_util:
                    dic_time_util[x[0]] = x[1]
                dic_time_flow = dict()
                time_util_flow = []
                for x in time_flow:
                    dic_time_flow[x[0]] = x[1]
                for t in time_common:
                    time_util_flow += [(t, dic_time_util[t], dic_time_flow[t])]
                host_time_util_flow[host] = time_util_flow

        local_pltpic = self.pltpic
        sub_pic = local_pltpic + 1
        nodes_nun = 0
        sub_node_cnt = dict()
        colors = ['r', 'g', 'b', 'c', 'm']
        for cpu_model in self.dic_host_type:
            sub_node_cnt[cpu_model] = 0

        for host_cpu in host_time_util_flow:
            nodes_nun += 1

            time_u_f = host_time_util_flow[host_cpu]
            time_u_f = sorted(time_u_f)
            times = map(lambda x: x[0], time_u_f)
            times = map(lambda x: (x - self.utime_base), times)  # Unit: minute
            utils_per_flow = map(lambda x: float(x[1])/float(x[2]), time_u_f)
            cpu_type_index = self.dic_caption["CPU_TYPE_IN_NUM"]
            cpu_model_name = self.data_items[self.dic_host_instance[host_cpu]][self.dic_caption["CPU_MODEL_NAME"]]
            cpu_type = self.data_items[self.dic_host_instance[host_cpu]][cpu_type_index]
            sub_node_cnt[cpu_model_name] += 1
        """
            plt.figure(local_pltpic)
            plt.plot(times, utils_per_flow, colors[cpu_type])

            plt.figure(sub_pic + cpu_type)
            plt.plot(times, utils_per_flow, colors[cpu_type])

        plt.figure(local_pltpic)
        plt.xlabel("Time (minutes)")
        plt.title('Unified CPU Util (2637v2,2637v3,2640v4 - num:%d' % nodes_nun)
        for cpu_model in self.dic_host_type:
            plt.figure(sub_pic + self.dic_host_type[cpu_model])
            plt.title('Unified CPU Util (%s - num:%d)' % (cpu_model, sub_node_cnt[cpu_model]))
            plt.xlabel("Time (minutes)")
        self.pltpic += (1 + len(self.dic_host_type))
        """

        #
        # Calculate average cpu utilization for general CPU model
        #
        plt.figure(self.pltpic)
        cpu_util = dict()
        for cpu_model in self.dic_host_type:
            cpu_util[cpu_model] = 0.0

        timestamp_all = []
        for host in host_time_util_flow:
            time_u_f = host_time_util_flow[host]
            for x in time_u_f:
                if x[0] not in timestamp_all:
                    timestamp_all.append(x[0])
        # Create timestamp array for each CPU model
        cpu_model_num = len(self.dic_host_type)
        time_cpu_model_util = dict()
        for t in timestamp_all:
            time_cpu_model_util[t] = [0.0 for i in range(0, cpu_model_num)]
        for cpu_model in self.dic_host_type:
            sub_node_cnt[cpu_model] = 0
        for host_cpu in host_time_util_flow:
            time_u_f = host_time_util_flow[host_cpu]
            cpu_type_index = self.dic_caption["CPU_TYPE_IN_NUM"]
            cpu_model_name = self.data_items[self.dic_host_instance[host_cpu]][self.dic_caption["CPU_MODEL_NAME"]]
            cpu_type = self.data_items[self.dic_host_instance[host_cpu]][cpu_type_index]
            sub_node_cnt[cpu_model_name] += 1
            for time_uf in time_u_f:
                #time_cpu_model_util[time_uf[0]][cpu_type] += float(time_uf[1])/float(time_uf[2])
                time_cpu_model_util[time_uf[0]][cpu_type] += float(time_uf[1])

        times = [t for t in time_cpu_model_util]
        times = sorted(times)
        times_plt = map(lambda x: (x - self.utime_base), times)  # Unit: minute

        for model in self.dic_host_type:
            vals=[]
            for t in times:
                vals += [time_cpu_model_util[t][self.dic_host_type[model]]]
            plt.plot(times_plt, [x/sub_node_cnt[model] for x in vals], colors[self.dic_host_type[model]])
        plt.title("Average CPU Utilization")
        plt.xlabel("Time")
        self.pltpic += 1

    def time_to_seconds(self, str_time):
        t = long(str_time)
        s = t%100
        t /= 100
        m = t%100
        t /= 100
        h = t/100
        return (s+m*60+h*60+60)

ac = VisualizeAC()
ac.parse_deploy_info()
ac.parse_cpu_utilization()
ac.parse_host_pressure()
ac.draw_cpu_pressure()
ac.parse_host_tm()
ac.draw_cpu_tm()
ac.parse_cpu_util_sys_user()
#ac.draw_unified_qps_cpu_utilization()
#ac.draw_unified_qps_cpu_utilization(True)

ac.draw_cpu_utils(True)
ac.draw_cpu_utils()

plt.show()

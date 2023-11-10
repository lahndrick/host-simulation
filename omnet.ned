import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.common.IntegratedVisualizer;
import inet.node.ethernet.EthernetSwitch;
import inet.node.wireless.AccessPoint;
import inet.node.inet.StandardHost;
import inet.node.inet.WirelessHost;
import ned.DatarateChannel;

network Hybrid
{
    parameters:
        int numHosts = 10;
        int numWHosts;

        @display("bgb=1426.2224,845.61");
        @statistic[endToEndDelay](title="end-to-end delay"; source="messageAge(rcvdPk)"; units=s; record=histogram,vector; interpolationmode=none);
        @statistic[throughput](title="throughput"; unit=bps; source="throughput(rcvdPk)"; record=histogram,vector);

    types:
        channel Ether1000M extends DatarateChannel
        {
            datarate = 1000Mbps;
            delay = 0.1us;
        }

    submodules:
        server: StandardHost {
            @display("p=629.7412,113.145;i=device/server");
        }

        centreSwitch: EthernetSwitch {
            @display("p=629,330");
        }
        etherSwitch1: EthernetSwitch {
            @display("p=393.03,165.25125");
        }
        etherSwitch2: EthernetSwitch {
            @display("p=334.96875,491.28748");
        }
        etherSwitch3: EthernetSwitch {
            @display("p=629,525");
        }
        etherSwitch4: EthernetSwitch {
            @display("p=943,460");
        }
        etherSwitch5: EthernetSwitch {
            @display("p=943,205");
        }

        standardHost1[numHosts]: StandardHost {
            @display("p=214.37999,156.31874");
        }
        standardHost2[numHosts]: StandardHost {
            @display("p=156.31874,510.64124");
        }
        standardHost3[numHosts]: StandardHost {
            @display("p=510,667");
        }
        standardHost4[numHosts]: StandardHost {
            @display("p=1052,574");
        }
        standardHost5[numHosts]: StandardHost {
            @display("p=1122,254");
        }

        wirelessHost1[numWHosts]: WirelessHost {
            @display("p=171.20624,306.6825");
        }
        wirelessHost2[numWHosts]: WirelessHost {
            @display("p=138.45375,701.20123");
        }
        wirelessHost3[numWHosts]: WirelessHost {
            @display("p=754,765");
        }
        wirelessHost4[numWHosts]: WirelessHost {
            @display("p=1238,494");
        }
        wirelessHost5[numWHosts]: WirelessHost {
            @display("p=1271,138");
        }

        accessPoint1: AccessPoint {
            @display("p=294.7725,251.59874");
        }
        accessPoint2: AccessPoint {
            @display("p=266.48624,614.85376");
        }
        accessPoint3: AccessPoint {
            @display("p=714,640");
        }
        accessPoint4: AccessPoint {
            @display("p=1097,460");
        }
        accessPoint5: AccessPoint {
            @display("p=1076,125");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=509.4375,62.5625");
        }

        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=965.25,60.775");
        }

        visualizer: IntegratedVisualizer {
            @display("p=822.25,62.5625");
        }
        
    connections:
        server.ethg++ <--> Ether1000M <--> centreSwitch.ethg++;

        centreSwitch.ethg++ <--> Ether1000M <--> etherSwitch1.ethg++;
        centreSwitch.ethg++ <--> Ether1000M <--> etherSwitch2.ethg++;
        centreSwitch.ethg++ <--> Ether1000M <--> etherSwitch3.ethg++;
        centreSwitch.ethg++ <--> Ether1000M <--> etherSwitch4.ethg++;
        centreSwitch.ethg++ <--> Ether1000M <--> etherSwitch5.ethg++;

        etherSwitch1.ethg++ <--> Ether1000M <--> accessPoint1.ethg++;
        etherSwitch2.ethg++ <--> Ether1000M <--> accessPoint2.ethg++;
        etherSwitch3.ethg++ <--> Ether1000M <--> accessPoint3.ethg++;
        etherSwitch4.ethg++ <--> Ether1000M <--> accessPoint4.ethg++;
        etherSwitch5.ethg++ <--> Ether1000M <--> accessPoint5.ethg++;

        //connecting 50 ethernet hosts, 20 max per node
        for x=0..numHosts-1 {
            etherSwitch1.ethg++ <--> Ether1000M <--> standardHost1[x].ethg++;
            etherSwitch2.ethg++ <--> Ether1000M <--> standardHost2[x].ethg++;
            etherSwitch3.ethg++ <--> Ether1000M <--> standardHost3[x].ethg++;
            etherSwitch4.ethg++ <--> Ether1000M <--> standardHost4[x].ethg++;
            etherSwitch5.ethg++ <--> Ether1000M <--> standardHost5[x].ethg++;
        }
}

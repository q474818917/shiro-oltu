package com.dwarf.utils;

import java.io.IOException;

import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;

public class ZookeeperUtils {
	public static void main(String args[]) throws IOException{
		ZooKeeper zk = new ZooKeeper("127.0.0.1:9080", 5000, new Watcher() { 
            // 监控所有被触发的事件
            public void process(WatchedEvent event) { 
                System.out.println("已经触发了" + event.getType() + "事件！"); 
            } 
        });
		
		try {
			System.out.println(zk.getChildren("/collections", true));
		} catch (KeeperException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(zk);
	}
}

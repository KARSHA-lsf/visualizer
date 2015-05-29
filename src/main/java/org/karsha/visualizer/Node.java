package org.karsha.visualizer;

/*
 * This is POJO object which models the Node. Node has three properties such as group and node id, name
 * tostring method print the node as string format
 * group is bond or equity
 * nodeId contain index
 * name is node given name such as transport,admin,heathsoc...
 * */
public class Node {
	
	String group;
	String nodeid;
	String name;
	String description;
	int indegree;
	int outdegree;
	
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getNodeid() {
		return nodeid;
	}
	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getdescription() {
		return description;
	}
	public void setdescription(String description) {
		this.description = description;
	}
	public int getIndegree() {
		return indegree;
	}
	public void setIndegree(String group) {
		this.indegree = indegree;
	}
	public int getOutdegree() {
		return outdegree;
	}
	public void setOutdegree(String group) {
		this.outdegree = outdegree;
	}
	
	@Override
	public String toString() {
		String node="\""+group+" "+nodeid+" "+name+"\"";
		return node;
	}
	
}

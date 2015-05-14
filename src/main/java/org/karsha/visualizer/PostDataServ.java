package org.karsha.visualizer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.jgrapht.DirectedGraph;
import org.jgrapht.graph.DefaultEdge;

import DBconnect.ConnectionPool;
import DBconnect.QueryDB;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.util.logging.*;

/**
 * Servlet implementation class PostDataServ
 */

public class PostDataServ extends HttpServlet {

	private static Logger logger = Logger.getLogger(PostDataServ.class
			.getName());

	private static final long serialVersionUID = 1L;

	public static Node[] nodeSet = null;
	public static Links[] linkSet = null;
	public static DirectedGraph<Node, DefaultEdge> g = null;
	List<Node> node;
	List<Links> linkCompleteTriad;
	List<Links> linkIncomplete;
	List<Links> linkChain;
	Connection connect = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostDataServ() {
		super();

	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		logger.info("servlet initiating.....");

		DBconnect.ConnectionPool con = new ConnectionPool();

		connect = con.getConnection();
		DBconnect.QueryDB qdb = new QueryDB();

		String q_gt = qdb.getFromDB("select * from emid_nodes", connect).toString();
		ObjectMapper mapper = new ObjectMapper();

		try {
			nodeSet = mapper.readValue(q_gt, Node[].class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * doPost method contain set of servlet paths and invokes the method of
	 * DirectedGraphDemoServ class
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		logger.log(Level.SEVERE, "doPost  Data:{0},{1}", new Object[] {
				"request", "response" });

		/**
		 * userPath is Servlet path that to be invoked for example, if /indegre
		 * excecuted the relevant method would invoke
		 * */
		String userPath = request.getServletPath();

		/* Gson library have been used */
		Gson gson = new Gson();

		/**
		 * PostDataServ is defined in web.xml file { all the user paths defined
		 * there } servlet get inputstream from the ajax and read the data using
		 * GSON library which separates the arryas and object from inputstrema
		 * data.In stream contain NODE ARRAY and LINKS ARRY as JSON format.
		 * Jackson mapper identified the nodes list and links list then put it
		 * into the nodeSet array and linkSet array which are used later
		 * operations. Also here initiate the graph from
		 * DirectedGraphDemoServ.Count the Triads when iniitiating.
		 * 
		 * */

		if (userPath.equals("/dataGet")) {
			DBconnect.ConnectionPool con = new ConnectionPool();

			connect = con.getConnection();
			DBconnect.QueryDB qdb = new QueryDB();
			
			String Q = request.getParameter("Q");
			String Query = null;
			
			Query = "SELECT `source`,`target` FROM `emid_all_data` WHERE `"+Q+"`=1";
			System.out.println("it's Q"+Query);

			String q_gt = qdb.getFromDB(Query, connect).toString();
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			try {
				linkSet = mapper.readValue(q_gt, Links[].class);
				System.out.println("length : "+linkSet.length);
				g = DirectedGraphDemoServ.createHrefGraph(nodeSet, linkSet);

				JsonObject Obj = new JsonObject();
				JsonElement links = gson.toJsonTree(linkSet);
				JsonElement nodes = gson.toJsonTree(nodeSet);
				Obj.add("links", links);
				Obj.add("nodes", nodes);
				out.println(Obj.toString());
				out.close();

			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (userPath.equals("/PostDataServ")) {
			logger.info("userPath is " + userPath);
			PrintWriter out = response.getWriter();
			InputStream s = request.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(s));

			String o = "";
			o = br.readLine();

			System.out.println(o);

			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(o);
			JsonNode nodes = root.get("nodes");
			JsonNode linkObj = root.get("link");
			JsonNode links = linkObj.get("links");

			if (nodes != null && linkObj != null) {
				// nodeSet = mapper.readValue(nodes, Node[].class);
				linkSet = mapper.readValue(links, Links[].class);
				System.out.println("nodeset length " + nodeSet.length);
				System.out.println("linkset length " + linkSet.length);

				// System.out.println(linkSet[0].getQ3());

				// this is for send node set data with link set as json
				// node = Arrays.asList(nodeSet);

				g = DirectedGraphDemoServ.createHrefGraph(nodeSet, linkSet);
				// linkChain = DirectedGraphDemoServ.LongerChain(g, nodeSet);
				linkCompleteTriad = DirectedGraphDemoServ.CompleteTriad(g,
						nodeSet);
				linkIncomplete = DirectedGraphDemoServ.InCompleteTriad(g,
						nodeSet);
				// DirectedGraphDemoServ.TriadInChain(g, nodeSet);
				// DirectedGraphDemoServ.chainDepthTwo(g, nodeSet);

			}
			/**
			 * when Indegree executed it wil return the set of link array where
			 * it calculated from graph method findHighInDegree will be called
			 * according to quater or year, data also will be filtered then
			 * convet it to GSON element. and that object will put to output
			 * stream. the it will read from ajax in web pages.
			 * 
			 * */
		} else if (userPath.equals("/Indegree")) {
			logger.info("userPath is " + userPath);

			DirectedGraph<Node, DefaultEdge> gg;

			gg = DirectedGraphDemoServ.createHrefGraph(nodeSet, linkSet);

			List<Links> link = DirectedGraphDemoServ.findHighInDegree(gg,
					nodeSet);

			response.setContentType("application/json");

			PrintWriter out = response.getWriter();
			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(link);
			JsonElement nodes = gson.toJsonTree(nodeSet);
			Obj.add("links", links);
			Obj.add("nodes", nodes);

			out.println(Obj.toString());
			out.close();

			/**
			 * when Outdegree executed it wil return the set of link array where
			 * it calculated from graph method findHighOutDegree will be called
			 * according to quater or year, data also will be filtered then
			 * convet it to GSON element. and that object will put to output
			 * stream. the it will read from ajax in web pages.
			 * 
			 * */
		} else if (userPath.equals("/Outdegree")) {
			logger.info("userPath is " + userPath);
			
			DirectedGraph<Node, DefaultEdge> gg;

			gg = DirectedGraphDemoServ.createHrefGraph(nodeSet, linkSet);

			List<Links> link = DirectedGraphDemoServ.findHighOutDegree(gg,
					nodeSet);

			response.setContentType("application/json");

			PrintWriter out = response.getWriter();
			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(link);
			JsonElement nodes = gson.toJsonTree(nodeSet);
			Obj.add("links", links);
			Obj.add("nodes", nodes);

			out.println(Obj.toString());
			out.close();
			/**
			 * CompleteTriad executed the it will return set of links list
			 * object from calculated which will filter according to the quater
			 * or year and put it into the output stream. Two GSON element will
			 * be seperated node set and links set.
			 * 
			 * */
		} else if (userPath.equals("/CompleteTriad")) {
			logger.info("userPath is " + userPath);

			DirectedGraph<Node, DefaultEdge> gg;

			gg = DirectedGraphDemoServ.createHrefGraph(nodeSet, linkSet);

			linkCompleteTriad = DirectedGraphDemoServ
					.CompleteTriad(gg, nodeSet);

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();

			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(linkCompleteTriad);
			JsonElement nodes = gson.toJsonTree(nodeSet);

			Obj.add("links", links);
			Obj.add("nodes", nodes);
			
			out.println(Obj.toString());
			out.close();

			/**
			 * InCompleteTriad executed the it will return set of links list
			 * object from calculated which will filter according to the quater
			 * or year and put it into the output stream. Two GSON element will
			 * be seperated node set and links set.it will be prited in output
			 * stream.
			 * 
			 * */
		} else if (userPath.equals("/IncompleteTriad")) {
			logger.info("userPath is " + userPath);
			DirectedGraph<Node, DefaultEdge> gg = DirectedGraphDemoServ
					.createHrefGraph(nodeSet, linkSet);

			linkIncomplete = DirectedGraphDemoServ.InCompleteTriad(gg, nodeSet);
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();

			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(linkIncomplete);
			JsonElement nodes = gson.toJsonTree(nodeSet);

			Obj.add("links", links);
			Obj.add("nodes", nodes);

			out.println(Obj.toString());
			out.close();

			/**
			 * this will return set of immediate cycles of graph. which
			 * calculated from DirectedGraph. node set and link set put two GSON
			 * element and put it to output stream.
			 * 
			 * */
		} else if (userPath.equals("/ImmediateCycles")) {
			logger.info("userPath is " + userPath);

			DirectedGraph<Node, DefaultEdge> gg = DirectedGraphDemoServ
					.createHrefGraph(nodeSet, linkSet);

			List<Links> link = DirectedGraphDemoServ.findImmidietCycles(gg,
					nodeSet);

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();

			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(link);
			JsonElement nodes = gson.toJsonTree(nodeSet);

			Obj.add("links", links);
			Obj.add("nodes", nodes);

			out.print(Obj.toString());
			out.close();

			/**
			 * 
			 * This will return the cluster coeffient of the graph. according to
			 * given quarter it can be read from ajax in web pages.
			 */
		} else if (userPath.equals("/QTempPat")) {
			logger.info("userPath is " + userPath);
			
			Links[] link_QT = null;
			DBconnect.QueryDB qdb = new QueryDB();
			String year = request.getParameter("year");
			String Query = "select source,target ,p_value_"+year+",p_value_"+year+"_Q1,p_value_"+year
					+"_Q2,p_value_"+year+"_Q3,p_value_"+year+"_Q4 from all_data where p_value_"+year
					+" = 1 or p_value_"+year+"_Q1=1 or p_value_"+year+"_Q2=1 or p_value_"+year
					+"_Q3=1 or p_value_"+year+"_Q4=1";

			String q_gt = qdb.getFromDB_QT(Query, connect).toString();
			
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			try {
				link_QT = mapper.readValue(q_gt, Links[].class);
				
				JsonObject Obj = new JsonObject();
				JsonElement links = gson.toJsonTree(link_QT);
				JsonElement nodes = gson.toJsonTree(nodeSet);
				Obj.add("links", links);
				Obj.add("nodes", nodes);
				out.println(Obj.toString());
				out.close();

			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		} else if (userPath.equals("/cc")) {
			logger.info("userPath is " + userPath);
			PrintWriter out = response.getWriter();

			DirectedGraph<Node, DefaultEdge> gg = DirectedGraphDemoServ
					.createHrefGraph(nodeSet, linkSet);

			double cc_value = DirectedGraphDemoServ.clusteringCoefficient(gg,
					nodeSet, linkSet);
			JsonElement Clustering_C = gson.toJsonTree(cc_value);
			JsonObject obj = new JsonObject();
			obj.add("Clustering_C", Clustering_C);
			out.print(obj.toString());
			out.close();

			/**
			 * This will called set of chain already calculated of graph. links
			 * and nodes object is add to output stream using servlet reponse
			 * object.
			 * 
			 * */
		} else if (userPath.equals("/chain")) {
			logger.info("userPath is " + userPath);

			int quater = Integer.parseInt(request.getParameter("Quater"));

			Links[] link = DirectedGraphDemoServ.link_filter(quater, linkSet);

			PrintWriter out = response.getWriter();

			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(link);
			JsonElement nodes = gson.toJsonTree(node);

			Obj.add("links", links);
			Obj.add("nodes", nodes);

			out.print(Obj.toString());
			out.close();

		} else if (userPath.equals("/chain1")) {
			logger.info("userPath is " + userPath);
			PrintWriter out = response.getWriter();
			int quater = Integer.parseInt(request.getParameter("Quater"));
			Links[] link = DirectedGraphDemoServ.link_filter(quater, linkSet);

			JsonObject Obj = new JsonObject();

			JsonElement links = gson.toJsonTree(link);
			JsonElement nodes = gson.toJsonTree(node);

			Obj.add("links", links);
			Obj.add("nodes", nodes);

			out.print(Obj.toString());
			out.close();

			/**
			 * here contains the set of data values of triads and number of
			 * edges contains in the graph and cluster coeffient of each year.
			 * and filtering all the data according to quater or year.
			 * 
			 * */
		} else if (userPath.equals("/count")) {
			logger.info("userPath is " + userPath);
			ArrayList<Integer> edges_count_arry = new ArrayList<Integer>();
			ArrayList<Integer> completed_traid_count_arry = new ArrayList<Integer>();
			ArrayList<Integer> incompleted_traid_count_arry = new ArrayList<Integer>();
			ArrayList<Double> cc_count_arry = new ArrayList<Double>();
			ArrayList<Integer> indegree = new ArrayList<Integer>();
			ArrayList<Integer> outdegree = new ArrayList<Integer>();
			
			
			PrintWriter out = response.getWriter();
			ObjectMapper mapper = new ObjectMapper();
			response.setContentType("application/json");
			DirectedGraph<Node, DefaultEdge> gg;
			
			DBconnect.ConnectionPool con = new ConnectionPool();
			connect = con.getConnection();
			DBconnect.QueryDB qdb = new QueryDB();
			String Q = null,Query = null;;
			int counting = 0;
			
			for (int i = 0; i < 29; i++) {
			out.print(i+",");
			}
			out.println();
			
			for (int i = 2003; i < 2011; i++) {
				for (int j = 1; j < 13; j++) {
					if((i==2003 & j<7)|(i==2010 & j>4)) continue;
					if(j<10){
						Q = i+"-0"+j;
					}else{
						Q = i+"-"+j;
					}
					
					Query = "SELECT `source`,`target` FROM `emid_all_data` WHERE `"+Q+"`=1";
					String q_gt = qdb.getFromDB(Query, connect).toString();
					
					Links[] linkSetCount = mapper.readValue(q_gt, Links[].class);
					
					
					gg = DirectedGraphDemoServ.createHrefGraph(nodeSet, linkSetCount);
					
					/*edges_count_arry.add(linkSetCount.length);
					completed_traid_count_arry.add(DirectedGraphDemoServ
							.CompleteTriad_count(gg, nodeSet));
					incompleted_traid_count_arry.add(DirectedGraphDemoServ
							.InCompleteTriad_count(gg, nodeSet));
					cc_count_arry.add(DirectedGraphDemoServ.clusteringCoefficient(
							gg, nodeSet, linkSetCount));
					
					DirectedGraphDemoServ.indegree_get(gg, nodeSet,indegree);
					DirectedGraphDemoServ.outdegree_get(gg, nodeSet,outdegree);*/
					
					ArrayList<Node> connected_nodes_out = new ArrayList<Node>();
					
					
					//connected_nodes_out = DirectedGraphDemoServ.Bonacich(gg, nodeSet,connected_nodes_out,1,2);
					//System.out.println(counting+" :"+connected_nodes_in+" "+connected_nodes_in.size()+" : "+connected_nodes_out.size()+" :"+connected_nodes_out);
					for (int k = 0; k < 29; k++) {
						int a = DirectedGraphDemoServ.Bonacich(gg, nodeSet,k,2);
						out.print(a+",");
					}
					out.println();
					
					
					counting++;
					
				}
			}
			//System.out.println("node name : "+nodeSet[1].description);
			//System.out.println("kkkkkkkkkkkk :"+connected_nodes.size());
			//out.println("edges count : " + edges_count_arry);
			//out.println("completed traid : " + completed_traid_count_arry);
			//out.println("incompleted traid : " + incompleted_traid_count_arry);
			//out.println("cc value : " + cc_count_arry);
			//out.println("outdegree array length :"+outdegree.size());
			int counter =1;
			for (int i = 0; i < outdegree.size(); i++) {
				
				if(counter%29==0){
					out.println(outdegree.get(i)+",");
				}else{
					out.print(outdegree.get(i)+",");
				}
				counter++;
			}
			
			//out.println("outdegree :"+outdegree);
			
			
			
			
			
			
		/*	
			
			for (int i = 1; i < 6; i++) {
				Links[] link = DirectedGraphDemoServ.link_filter(i, linkSet);
				edges_count_arry.add(link.length);

				DirectedGraph<Node, DefaultEdge> gg = DirectedGraphDemoServ
						.createHrefGraph(nodeSet,
								DirectedGraphDemoServ.link_filter(i, linkSet));

				completed_traid_count_arry.add(DirectedGraphDemoServ
						.CompleteTriad_count(gg, nodeSet));
				incompleted_traid_count_arry.add(DirectedGraphDemoServ
						.InCompleteTriad_count(gg, nodeSet));
				cc_count_arry.add(DirectedGraphDemoServ.clusteringCoefficient(
						gg, nodeSet, linkSet));
			}

			out.println("edges count : " + edges_count_arry);
			out.println("completed traid : " + completed_traid_count_arry);
			out.println("incompleted traid : " + incompleted_traid_count_arry);
			out.println("cc value : " + cc_count_arry);
*/
			out.close();

		} else if (userPath.equals("/get_degrees")) {
			/*logger.info("userPath is " + userPath);
			ArrayList<Integer> degrees = new ArrayList<Integer>();
			PrintWriter out = response.getWriter();

			for (int i = 5; i < 6; i++) {
				Links[] link = DirectedGraphDemoServ.link_filter(i, linkSet);

				DirectedGraph<Node, DefaultEdge> gg = DirectedGraphDemoServ
						.createHrefGraph(nodeSet,
								DirectedGraphDemoServ.link_filter(i, linkSet));
				
				degrees = DirectedGraphDemoServ.indegree_get(gg, nodeSet);
				for (int j = 0; j < degrees.size(); j++) {
					if (j == degrees.size() - 1)
						out.print(degrees.get(j));
					else
						out.print(degrees.get(j) + ",");

				}
				out.println();
				
				 * DBconnector dbCon = new DBconnector(); try {
				 * dbCon.dbConnect(); } catch (Exception e) { // TODO
				 * Auto-generated catch block e.printStackTrace(); }
				 
			}*/

		} else if (userPath.equals("/ReadJson")) {
			PrintWriter out = response.getWriter();
			ArrayList<Integer> edges_count_arry = new ArrayList<Integer>();
			ArrayList<Integer> completed_traid_count_arry = new ArrayList<Integer>();
			ArrayList<Integer> incompleted_traid_count_arry = new ArrayList<Integer>();
			ArrayList<Double> cc_count_arry = new ArrayList<Double>();
			Links[] set = null;
			/* iterating over all years */
			for (int i = 2005; i < 2013; i++) {
				String filePath = "/json/data" + i + ".json";
				String path = request.getServletContext().getRealPath(filePath);
				// System.out.println(path);

				/* reading json file using buffered reader */
				BufferedReader br = new BufferedReader(new FileReader(path));

				/* string builder for appending ease */
				StringBuilder builder = new StringBuilder();
				String line = "";

				/* read and appending each line */
				while ((line = br.readLine()) != null) {
					builder.append(line);
				}

				// convert to stringbuilder to string
				String Jstring = builder.toString();

				/* mapping the json string to chuncks */
				ObjectMapper mapper = new ObjectMapper();
				JsonNode root = mapper.readTree(Jstring);
				JsonNode linkObj = root.get("links");

				/* reads the links array and assgning value */
				if (linkObj != null) {
					set = mapper.readValue(linkObj, Links[].class);
					System.out.println(filePath + " " + set.length);
					// System.out.println(linkSet.length);

					for (int k = 1; k < 6; k++) {
						Links[] link = DirectedGraphDemoServ
								.link_filter(k, set);
						edges_count_arry.add(link.length);

						DirectedGraph<Node, DefaultEdge> gg = DirectedGraphDemoServ
								.createHrefGraph(nodeSet, DirectedGraphDemoServ
										.link_filter(k, link));

						completed_traid_count_arry.add(DirectedGraphDemoServ
								.CompleteTriad_count(gg, nodeSet));
						incompleted_traid_count_arry.add(DirectedGraphDemoServ
								.InCompleteTriad_count(gg, nodeSet));
						cc_count_arry.add(DirectedGraphDemoServ
								.clusteringCoefficient(gg, nodeSet, link));

					}

				}

				br.close();
			}

			String header = "State,Quarter-1,Quarter-2,Quarter-3,Quarter-4,Annual";

			overall_data_update(
					request.getServletContext().getRealPath(
							"/csv/cc_overall_data.csv"), header, cc_count_arry);
			overall_data_update(
					request.getServletContext().getRealPath(
							"/csv/comTraid_overall_data.csv"), header,
					completed_traid_count_arry);
			overall_data_update(
					request.getServletContext().getRealPath(
							"/csv/edges_overall_data.csv"), header,
					edges_count_arry);
			overall_data_update(
					request.getServletContext().getRealPath(
							"/csv/incomTraid_overall_data.csv"), header,
					incompleted_traid_count_arry);

			out.println("edges count : " + edges_count_arry);
			out.println("completed traid : " + completed_traid_count_arry);
			out.println("incompleted traid : " + incompleted_traid_count_arry);
			out.println("cc value : " + cc_count_arry);

			// out.println("lengths: "+edges_count_arry.size()+" "+completed_traid_count_arry.size());

		}

	}

	public static void overall_data_update(String path1, String header,
			ArrayList<?> arr) {

		overall_dataUpdate ow = new overall_dataUpdate();
		ow.write_it(path1, header, arr);
	}

}

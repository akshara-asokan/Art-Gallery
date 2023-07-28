<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONObject"%>
<%@page import=" org.json.JSONArray"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("rating_data") != null) {

        String ins = "INSERT INTO tbl_eventrating(user_name,customer_id,artist_id,artistevent_id,rating_value,rating_feedback,rating_date)"
                + "VALUES('" + request.getParameter("user_name") + "','"+session.getAttribute("userid")+"','"+session.getAttribute("arid")+"','"+request.getParameter("labour_id")+"','" + request.getParameter("rating_data") + "','" + request.getParameter("user_review") + "',SYSDATE())";
out.println(ins);
        if (con.executeCommand(ins)) {
            out.println("Your Review & Rating Successfully Submitted");
        } else {
            out.println("Your Review & Rating Insertion Failed");
        }

    }

    if (request.getParameter("action") != null) {
        int average_rating = 0;
        int total_review = 0;
        int five_star_review = 0;
        int four_star_review = 0;
        int three_star_review = 0;
        int two_star_review = 0;
        int one_star_review = 0;
        int total_user_rating = 0;

        String query = "SELECT * FROM tbl_eventrating where artistevent_id = '"+request.getParameter("lid")+"' ORDER BY rating_date DESC";

        ResultSet rs = con.selectCommand(query);

        JSONObject b = new JSONObject();
        JSONArray J = new JSONArray();
        JSONObject a = new JSONObject();
        while (rs.next()) {

            a.put("user_name", rs.getString("user_name"));
            a.put("user_review", rs.getString("rating_feedback"));
            a.put("rating", rs.getString("rating_value"));
            a.put("datetime", rs.getString("rating_date"));

            J.put(a);

            if (rs.getString("rating_value").equals("5")) {
                five_star_review++;
            }
            if (rs.getString("rating_value").equals("4")) {
                four_star_review++;
            }
            if (rs.getString("rating_value").equals("3")) {
                three_star_review++;
            }
            if (rs.getString("rating_value").equals("2")) {
                two_star_review++;
            }
            if (rs.getString("rating_value").equals("1")) {
                one_star_review++;
            }

            total_review++;

            total_user_rating = total_user_rating + rs.getInt("rating_value");

        }

        average_rating = total_user_rating / total_review;

        b.put("average_rating", average_rating);
        b.put("total_review", total_review);
        b.put("five_star_review", five_star_review);
        b.put("four_star_review", four_star_review);
        b.put("three_star_review", three_star_review);
        b.put("two_star_review", two_star_review);
        b.put("one_star_review", one_star_review);
        b.put("review_data", J);

        out.println(b);
    }

%>
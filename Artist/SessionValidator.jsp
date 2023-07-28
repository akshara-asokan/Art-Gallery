<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("artistid") == null)
        {
            response.sendRedirect("../");
        }
    %>
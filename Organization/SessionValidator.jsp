<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("organizationid") == null)
        {
            response.sendRedirect("../");
        }
    %>
package filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/*")
public class UrlRewriteFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        String curUriRequest = httpServletRequest.getRequestURI();
        String curUriParam = httpServletRequest.getParameter("action");

        if(curUriRequest.endsWith("/home-servlet") && curUriParam.equals("direct")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/home");
        } else if(curUriRequest.endsWith("/movie-servlet") && curUriParam.equals("init")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/movie");
        } else if(curUriRequest.endsWith("/showtimes-servlet") && curUriParam.equals("init")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/showtime");
        } else if(curUriRequest.endsWith("/about.jsp")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/about");
        } else if(curUriRequest.endsWith("/newsComponent.jsp")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/news");
        } else if(curUriRequest.endsWith("/login.jsp")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login");
        } else if(curUriRequest.endsWith("/register.jsp")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/register");
        } else {
            // xử lí các request không cần rewriting
            chain.doFilter(request, response);
        }
    }
    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}

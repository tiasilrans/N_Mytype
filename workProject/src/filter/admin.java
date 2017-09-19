package filter;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class admin implements Filter{
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		HttpSession session = request.getSession();
		//===========================================
		if (session.getAttribute("login") != null) {
			if(session.getAttribute("info") == null){
				response.sendRedirect("/");
			}else{
				Map r = (Map)session.getAttribute("info");
				if(((BigDecimal)r.get("POWER")).intValue() > 0){
					chain.doFilter(req, resp);
				}else{
					response.sendRedirect("/");
				}
			}
		} else {
			response.sendRedirect("/");
		}
		
	}
}

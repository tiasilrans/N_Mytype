/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.0.M21
 * Generated at: 2017-08-30 09:12:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.join;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class join_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/D:/국기%204월(오후)%20박보라/MyType/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/workProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1502088492389L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("    \r\n");
      out.write("<style>\r\n");
      out.write(".joinbox{\r\n");
      out.write("\tborder: 1px solid;\r\n");
      out.write("\tborder-color: #d9d9d9;\r\n");
      out.write("\tmargin: 20px;\r\n");
      out.write("\twidth: auto%;\r\n");
      out.write("\theight: auto;\r\n");
      out.write("\tpadding: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#sbt,#cnbt{\r\n");
      out.write("\twidth : 360px;\r\n");
      out.write("\theight: 60px;\r\n");
      out.write("}\r\n");
      out.write("#email,#pw,#cn{\r\n");
      out.write("\twidth : 360px;\r\n");
      out.write("\theight: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>   \r\n");
      out.write("\r\n");
      out.write("<div align=\"center\" class=\"row\">\r\n");
      out.write("\t<div class=\"col-xs-0 col-md-4\"></div>\r\n");
      out.write("\t<div class=\"col-xs-12 col-md-4\">\r\n");
      out.write("\t\t\r\n");
      out.write(" <div class=\"form-group joinbox row\" >\r\n");
      out.write("\t\t\t<form action=\"/joinExec.mt\" method=\"post\">\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<h3 align=\"left\">회원가입 </h3>\r\n");
      out.write("\t\t\t\t<br/>\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t\t<input class=\"form-control\" type=\"email\"\r\n");
      out.write("\t\t\t\t\t\t\tplaceholder=\"e-mail\" name=\"email\" id=\"email\" required />\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div id=\"emailtrue\" style=\"display: none;\">\r\n");
      out.write("\t\t\t\t\t\t<br/><b>해당 이메일을 사용할 수 있습니다.사용하시겠습니까 ?<br/>\r\n");
      out.write("\t\t\t\t\t\t<button id=\"emailuse\" type=\"button\" class=\"btn\" style=\"display: block;\">확인</button>\r\n");
      out.write("\t\t\t\t\t\t</b>\r\n");
      out.write("\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<b id=\"emailfalse\" style=\"display: none;\"><br/>해당 이메일은 이미 사용중 입니다.</b>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t\t <input class=\"form-control\" type=\"password\" placeholder=\"비밀번호\" name=\"pw\" id=\"pw\"required />\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div id=\"cnrow\" class=\"form-group row\" style=\"display: none;\">\r\n");
      out.write("\t\t\t\t\t<b>※해당 이메일로 인증번호를 발송하였습니다.</b><br/>\r\n");
      out.write("\t\t\t\t\t<input class=\"form-control\" type=\"text\"\r\n");
      out.write("\t\t\t\t\t\tplaceholder=\"인증번호\" name=\"cn\" id=\"cn\" required />\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div align=\"center\" class=\"row\">\r\n");
      out.write("\t\t\t\t\t<button id=\"cnbt\" type=\"button\" class=\"btn\" style=\"display: block;\" disabled>이메일인증</button>\r\n");
      out.write("\t\t\t\t\t<button id=\"sbt\" type=\"submit\" class=\"btn\" style=\"display: none;\" disabled>회원가입</button>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<div class=\"col-xs-0 col-md-4\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t\r\n");
      out.write("\t//이메일 인증 버튼 활성화 \r\n");
      out.write("\t//이메일 비밀번호 텍스트창, 이메일 사용확인 버튼 눌렀을때 이메일 인증 버튼 활성화\r\n");
      out.write("\tfunction cnbtDisabled(){\r\n");
      out.write("\t\tvar e = $(\"#email\").val().length;\t\t//email 길이\r\n");
      out.write("\t\tvar p = $(\"#pw\").val().length;\t//password 길이\r\n");
      out.write("\t\tvar read = $(\"#email\").prop(\"readonly\");\t//이메일 사용 여부\r\n");
      out.write("\t\tconsole.log(read);\r\n");
      out.write("\t\tif( e > 0 && p > 0 && read){\r\n");
      out.write("\t\t\t$(\"#cnbt\").prop(\"disabled\", false);\t\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$(\"#cnbt\").prop(\"disabled\", true);\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#email\").keyup(cnbtDisabled);\r\n");
      out.write("\t$(\"#pw\").keyup(cnbtDisabled);\r\n");
      out.write("\t$(\"#emailuse\").on(\"click\",cnbtDisabled);\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t//이메일 사용여부 \r\n");
      out.write("\tfunction emailUse(){\r\n");
      out.write("\t\t$(\"#emailtrue\").css(\"display\",\"none\");\r\n");
      out.write("\t\tcnbtDisabled();\r\n");
      out.write("\t\t$(\"#email\").prop(\"readonly\",true);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#emailuse\").on(\"click\",emailUse);\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t//이메일 텍스트창에서 포커스 취소할때 마다 중복확인 이벤트 발생\r\n");
      out.write("\tfunction emailCheck(){\r\n");
      out.write("\t\tvar e = $(\"#email\").val().length;\r\n");
      out.write("\t\tif(e > 0){\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl:\"/emailcheck.mt\",\r\n");
      out.write("\t\t\t\tmethod : \"get\",\r\n");
      out.write("\t\t\t\tdata : {\r\n");
      out.write("\t\t\t\t\t\"email\" : $(\"#email\").val(),\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}).done(function(result) {\r\n");
      out.write("\t\t\t\tvar rst = JSON.parse(result);\r\n");
      out.write("\t\t\t\tif(rst.rst){\r\n");
      out.write("\t\t\t\t\t$(\"#emailtrue\").css(\"display\", \"block\");\r\n");
      out.write("\t\t\t\t\t$(\"#emailfalse\").css(\"display\", \"none\");\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$(\"#emailtrue\").css(\"display\", \"none\");\r\n");
      out.write("\t\t\t\t\t$(\"#emailfalse\").css(\"display\", \"block\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#email\").blur(emailCheck);\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t//이메일 인증을 눌럿을때의 이벤트\r\n");
      out.write("\t$(\"#cnbt\").on(\"click\",function(){\r\n");
      out.write("\t\t$(\"#cnrow\").css(\"display\", \"block\");\r\n");
      out.write("\t\t$(\"#cnbt\").css(\"display\", \"none\");\r\n");
      out.write("\t\t$(\"#sbt\").css(\"display\", \"block\");\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl:\"/emailUuidSend.mt\",\r\n");
      out.write("\t\t\tmethod : \"get\",\r\n");
      out.write("\t\t\tdata : {\r\n");
      out.write("\t\t\t\t\"email\" : $(\"#email\").val(),\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t})\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t//이메일 비밀번호 인증번호를 모두 입력했을시 회원가입 버튼 활성화\r\n");
      out.write("\tfunction sbtDisabled(){\r\n");
      out.write("\t\tvar e = $(\"#email\").val().length;\t\t//email 길이\r\n");
      out.write("\t\tvar p = $(\"#pw\").val().length;\t//password 길이\r\n");
      out.write("\t\tvar cn = $(\"#cn\").val().length;\t//이메일 사용 여부\r\n");
      out.write("\t\tif( e > 0 && p > 0 && cn > 0){\r\n");
      out.write("\t\t\t$(\"#sbt\").prop(\"disabled\", false);\t\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$(\"#sbt\").prop(\"disabled\", true);\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"#email\").keyup(sbtDisabled);\r\n");
      out.write("\t$(\"#pw\").keyup(sbtDisabled);\r\n");
      out.write("\t$(\"#cn\").keyup(sbtDisabled);\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/view/join/join.jsp(71,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${uuid ne null }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("<script>\r\n");
          out.write("\twindow.alert(\"인증번호값을 잘못 입력하였습니다.\");\t\r\n");
          out.write("</script>\r\n");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }
}

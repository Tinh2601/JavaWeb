package org.tinh123.securitywebapp.utils;

import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;
import javax.servlet.http.HttpServletRequest;

public class UrlPatternUtils {

   private static boolean hasUrlPattern(ServletContext servletContext, String urlPattern) {

      Map<String, ? extends ServletRegistration> map = servletContext.getServletRegistrations();

      for (String servletName : map.keySet()) {
         ServletRegistration sr = map.get(servletName);

         Collection<String> mappings = sr.getMappings();
         if (mappings.contains(urlPattern)) {
            return true;
         }

      }
      return false;
   }

   // servletPath:
   // ==> /spath
   // ==> /spath/*
   // ==> *.ext
   // ==> /
   public static String getUrlPattern(HttpServletRequest request) {
      ServletContext servletContext = request.getServletContext();
      //lấy cái ngữ cảnh của cái servlet mà chuyển tới cái request này
      String servletPath = request.getServletPath();
      // trả về đường dẫn của request này gọi tới servlet
      String pathInfo = request.getPathInfo();
      //trả về các đường dẫn thông tin bổ sung
      String urlPattern = null;
      if (pathInfo != null) {
         urlPattern = servletPath + "/*";   // đọc thông tin của cái hàm getPathInfo bằng cáo rê chuột vào 
         return urlPattern;					// nếu trả về như vậy là nó rỗng
      }										// tìm hiểu lệnh return trong java 
      urlPattern = servletPath;				// ...

      boolean has = hasUrlPattern(servletContext, urlPattern);
      if (has) {
         return urlPattern;
      }
      int i = servletPath.lastIndexOf('.');
      if (i != -1) {
         String ext = servletPath.substring(i + 1);
         urlPattern = "*." + ext;
         has = hasUrlPattern(servletContext, urlPattern);

         if (has) {
            return urlPattern;
         }
      }
      return "/";
   }
}
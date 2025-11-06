package ezcms.utils;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

/**
 * JDBC驱动清理监听器
 * 用于在Web应用停止时注销JDBC驱动，防止内存泄漏
 */
public class JdbcDriverCleanupListener implements ServletContextListener {
    
    public void contextInitialized(ServletContextEvent sce) {
        // 应用启动时无需特殊处理
        System.out.println("JDBC Driver Cleanup Listener initialized");
    }
    
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Starting JDBC driver cleanup...");
        
        // 清理MySQL遗弃连接线程（针对MySQL Connector 5.x）
        cleanupMySqlThreads();
        
        // 注销所有已注册的JDBC驱动
        deregisterJdbcDrivers();
        
        System.out.println("JDBC driver cleanup completed");
    }
    
    /**
     * 清理MySQL特定线程
     */
    private void cleanupMySqlThreads() {
        try {
            // 对于MySQL Connector 5.x版本
            Class<?> cleanupThreadClass = Class.forName("com.mysql.jdbc.AbandonedConnectionCleanupThread");
            java.lang.reflect.Method checkedShutdownMethod = 
                cleanupThreadClass.getDeclaredMethod("checkedShutdown");
            checkedShutdownMethod.invoke(null);
            System.out.println("MySQL abandoned connection cleanup thread stopped");
        } catch (Exception e) {
            System.err.println("Error stopping MySQL cleanup thread: " + e.getMessage());
        }
    }
    
    /**
     * 注销所有JDBC驱动
     */
    private void deregisterJdbcDrivers() {
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        int deregisteredCount = 0;
        
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                deregisteredCount++;
                System.out.println("Deregistered JDBC driver: " + driver.getClass().getName());
            } catch (SQLException e) {
                System.err.println("Error deregistering JDBC driver: " + 
                    driver.getClass().getName() + " - " + e.getMessage());
            }
        }
        
        System.out.println("Total JDBC drivers deregistered: " + deregisteredCount);
    }
}

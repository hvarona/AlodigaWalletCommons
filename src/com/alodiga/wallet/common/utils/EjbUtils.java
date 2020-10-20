package com.alodiga.wallet.common.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.transaction.UserTransaction;
import org.apache.log4j.Logger;
import com.alodiga.wallet.common.exception.GeneralException;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class EjbUtils {
    public static String DATE_FORMAT_1 = "dd/MM/yyyy";
    public static String DATE_FORMAT_2 = "dd/MM/yyyy HH:mm:ss";
    public static String DATE_FORMAT_3 = "EEEE, dd MMMM yyyy";
    public static String DATE_FORMAT_4 = "dd-MM-yyyy";
    public static String DATE_FORMAT_5 = "dd-MM-yyyy HH:mm:ss";

    public static void commit(UserTransaction userTransaction, Logger logger) throws GeneralException {
        try {
            userTransaction.commit();
        } catch (Exception e) {
            logger.warn("Error making a commit:", e);
            throw new GeneralException(logger, "General Error in commit transaction.", e);
        }
    }

    public static void rollback(UserTransaction userTransaction, Logger logger) throws GeneralException {
        try {
            userTransaction.rollback();
        } catch (Exception e1) {
            throw new GeneralException(logger, "General Error in rollback transaction. ", e1);
        }
    }

    public static void closeConnection(PreparedStatement ps, Connection con, Logger logger) {
        try {
            if (ps != null) {
                ps.close();
            }
        } catch (Exception e) {
            logger.warn("[SisacCommons][com.sg123.utils.EjbUtils][closeConnection()]Couldn't close PreparedStatement", e);
        }
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            logger.warn("[SisacCommons][com.sg123.utils.EjbUtils][closeConnection()]Couldn't close Connection", e);
        }
    }

        public static Date getEndingDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.AM_PM, Calendar.AM);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public static Date getBeginningDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.AM_PM, Calendar.AM);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }


    public static Date getBeginningDateMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.AM_PM, Calendar.AM);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public static Date getEndingDateMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.AM_PM, Calendar.AM);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }
    
    public static Date getBeginningDateAnnual(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_YEAR, 1);
        calendar.set(Calendar.AM_PM, Calendar.AM);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public static Date addDays(Date date, int daysNumber) {
        Calendar calendar = Calendar.getInstance();

        if (date != null) {
            calendar.setTime(date);
        }

        calendar.add(Calendar.DATE, -daysNumber);
        return calendar.getTime();
    }

    public static String getFormatedDate (Date date, String format) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }
    
    public static Timestamp convertStringToTimestampBeginningDate(String strDate) {
        try {
          DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
           // you can change format of date
          Date date = formatter.parse(strDate);         
          Timestamp timeStampDate = new Timestamp(getBeginningDate(date).getTime());
          return timeStampDate;
        } catch (ParseException e) {
          System.out.println("Exception :" + e);
          return null;
        }
      }
    
    public static Timestamp convertStringToTimestampEndingDate(String strDate) {
        try {
          DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
           // you can change format of date
          Date date = formatter.parse(strDate);       
          Timestamp timeStampDate = new Timestamp(getEndingDate(date).getTime());
          return timeStampDate;
        } catch (ParseException e) {
          System.out.println("Exception :" + e);
          return null;
        }
      }
    
    public static boolean isWeekEnd(Date date) {
    	boolean valid = false;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); 
    	if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY)
    		valid = true;
        return valid;
    }
}

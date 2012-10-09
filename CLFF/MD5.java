import java.security.*;
public abstract class MD5 {
   public static String toMD5(String input) {
      try {
         MessageDigest md = MessageDigest.getInstance("MD5");
      
         md.update(input.getBytes()); 
      	 byte[] output = md.digest();
         
         return bytesToHex(output);
         
      } catch (Exception e) {
    	  return "";
      }
   }
   public static String bytesToHex(byte[] b) {
      char hexDigit[] = {'0', '1', '2', '3', '4', '5', '6', '7',
                         '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
      StringBuffer buf = new StringBuffer();
      for (int j=0; j<b.length; j++) {
         buf.append(hexDigit[(b[j] >> 4) & 0x0f]);
         buf.append(hexDigit[b[j] & 0x0f]);
      }
      return buf.toString();
   }
}
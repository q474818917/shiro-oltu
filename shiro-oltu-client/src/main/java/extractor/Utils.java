package extractor;

import java.util.List;

public class Utils {
	public static String iltos(List<Integer> list) {
		byte[] bs = new byte[list.size()];
		for (int i = 0; i < bs.length; i++) {
			bs[i] = (byte) list.get(i).byteValue();
		}
		String str = new String(bs);
		return str;
	}
}

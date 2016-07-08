package extractor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Dictionary {
	
	private static Logger logger = LoggerFactory.getLogger(Dictionary.class);
	
	private Configuration conf;
	
	public Dictionary(){
		this.conf = DefaultConfig.getInstance();
	}
	
	IFloor mRootFloor = null;
	BaseNode mRootNode = null;

	public void insert(String tag) {
		byte[] bs = tag.getBytes();
		int data;

		BaseNode node = mRootNode;
		for (int i = 0; i < bs.length; i++) {
			data = bs[i];
			if (node.son == null) {
				node.son = newFloor();
			}
			node.son.insert(data);
			node = node.son.getSelected();
		}
		if (node != null)
			node.flag = true;
	}
	
	public void loadMainDict(){
		InputStream is = this.getClass().getClassLoader().getResourceAsStream(conf.getMainDictionary());
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is , "UTF-8"), 512);
			String theWord = null;
			do {
				theWord = br.readLine();
				if (theWord != null && !"".equals(theWord.trim())) {
					byte[] bs = theWord.trim().toLowerCase().getBytes();
					int data;

					BaseNode node = mRootNode;
					for (int i = 0; i < bs.length; i++) {
						data = bs[i];
						if (node.son == null) {
							node.son = newFloor();
						}
						node.son.insert(data);
						node = node.son.getSelected();
					}
					if (node != null)
						node.flag = true;
				}
			} while (theWord != null);
			
		} catch (IOException ioe) {
			System.err.println("Main Dictionary loading exception.");
			ioe.printStackTrace();
			
		}finally{
			try {
				if(is != null){
                    is.close();
                    is = null;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void init() {
		logger.info("字典加载中...");
		mRootFloor = newFloor();
		mRootFloor.insert(0);
		mRootNode = mRootFloor.getSelected();
		this.loadMainDict();
		logger.info("字典加载完毕...");
	}

	public void trace() {
		mRootFloor.traceTags();
	}

	public IFloor newFloor() {
		return new Simple();
	}

	public List<String> search(String content) {

		byte bs[] = content.getBytes();
		String str;

		List<Integer> tag = new ArrayList<Integer>();
		List<String> tags = new ArrayList<String>();
		int data;
		IFloor floor;
		BaseNode node = null;
		for (int i = 0; i < bs.length; i++) {

			if (node == null || node.son == null) {
				tag.clear();
				node = mRootNode;

				// continue;
			}
			floor = node.son;
			data = bs[i];
			node = floor.search(data);
			if (node != null) {
				tag.add(data);
				if (node.flag == true) {
					str = Utils.iltos(tag);
					tags.add(str);
				}
			}
		}
		return tags;
	}

	static public List<Tag> merge(List<String> tags) {
		List<Tag> ret = new ArrayList<>();
		Iterator<String> it = tags.iterator();
		String str;
		Tag tag;
		Tag find;
		while (it.hasNext()) {
			find = null;
			str = it.next();
			Iterator<Tag> itTag = ret.iterator();
			while (itTag.hasNext()) {
				tag = itTag.next();
				if (tag.name.equals(str)) {
					find = tag;
					break;
				}
			}
			if (find != null) {
				find.finds++;
			} else {
				find = new Tag();
				find.name = str;
				ret.add(find);
			}
		}
		return ret;
	}
}

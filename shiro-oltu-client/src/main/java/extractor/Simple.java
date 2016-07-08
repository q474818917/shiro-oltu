package extractor;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Simple implements IFloor {

	HashMap<Integer, Node> nodes = new HashMap<Integer, Node>();
	Node mSelected = null;

	class Node extends BaseNode {
		Node(int data) {
			this.data = data;
		}
	}

	@Override
	public void insert(int data) {
		Node node = (Node) search(data);
		if (node != null) {
			mSelected = node;
			return;
		}
		node = new Node(data);
		mSelected = node;
		nodes.put(data, node);
	}

	@Override
	public void trace() {

	}

	@Override
	public void traceTags() {
		traceTags(this, 0);
	}

	public void traceTags(Simple box, int depth) {
		Node node;
		int key;
		Map.Entry entry;
		Iterator iter = box.nodes.entrySet().iterator();
		while (iter.hasNext()) {
			entry = (Map.Entry) iter.next();
			key = (int) entry.getKey();
			node = (Node) entry.getValue();

			int d = depth;
			while (d-- > 0)
				System.out.print("-");
			System.out.print((char) node.data);

			if (node.flag == true) {
				System.out.print("[E]");
			}
			System.out.println("");
			if (node.son != null)
				traceTags((Simple) node.son, depth + 1);
		}
	}

	@Override
	public BaseNode search(int data) {
		return nodes.get(data);
	}

	@Override
	public BaseNode getSelected() {
		return mSelected;
	}

}

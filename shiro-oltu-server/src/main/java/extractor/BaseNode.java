package extractor;

abstract public class BaseNode {

	public IFloor son;
	public boolean flag;
	public int data;

	protected BaseNode() {
		son = null;
		flag = false;
	}

}

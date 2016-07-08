package extractor;

public interface IFloor {
	public void insert(int data);

	public void trace();

	public void traceTags();

	public BaseNode search(int data);

	public BaseNode getSelected();
}

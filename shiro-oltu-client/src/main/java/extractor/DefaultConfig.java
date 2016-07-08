package extractor;

public class DefaultConfig implements Configuration {
	
	private static final String PATH_DIC_MAIN = "dic/jiyu.dic";
	
	private DefaultConfig(){
		
	}
	
	public static Configuration getInstance(){
		return new DefaultConfig();
	}

	@Override
	public String getMainDictionary() {
		return PATH_DIC_MAIN;
	}


}

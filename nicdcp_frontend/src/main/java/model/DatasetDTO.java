package model;

public class DatasetDTO {
	private String var_name;
	private String var_type;
	private int missing_num;
	private int uni_value;
	private String min_value;
	private String max_value;
	private float avg_value;
	private float std_value;
	private String learning_id;
	private float var_imp;
	public String getVar_name() {
		return var_name;
	}
	public void setVar_name(String var_name) {
		this.var_name = var_name;
	}
	public String getVar_type() {
		return var_type;
	}
	public void setVar_type(String var_type) {
		this.var_type = var_type;
	}
	public int getMissing_num() {
		return missing_num;
	}
	public void setMissing_num(int missing_num) {
		this.missing_num = missing_num;
	}
	public int getUni_value() {
		return uni_value;
	}
	public void setUni_value(int uni_value) {
		this.uni_value = uni_value;
	}
	public String getMin_value() {
		return min_value;
	}
	public void setMin_value(String min_value) {
		this.min_value = min_value;
	}
	public String getMax_value() {
		return max_value;
	}
	public void setMax_value(String max_value) {
		this.max_value = max_value;
	}
	public float getAvg_value() {
		return avg_value;
	}
	public void setAvg_value(float avg_value) {
		this.avg_value = avg_value;
	}
	public float getStd_value() {
		return std_value;
	}
	public void setStd_value(float std_value) {
		this.std_value = std_value;
	}
	public String getLearning_id() {
		return learning_id;
	}
	public void setLearning_id(String learning_id) {
		this.learning_id = learning_id;
	}
	public float getVar_imp() {
		return var_imp;
	}
	public void setVar_imp(float var_imp) {
		this.var_imp = var_imp;
	}	
	
}

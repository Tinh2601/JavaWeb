package file3;

import java.util.Arrays;

public class Person {

    @Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", imageData=" + Arrays.toString(imageData) + ", imageFileName="
				+ imageFileName + "]";
	}

	private int id;
    private String name;
    private byte[] imageData;
    private String imageFileName;
    private String base64Image;
    
    public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    public Person() {

    }

    public Person(int id, String name, String imageFileName, byte[] imageData) {
        this.id = id;
        this.name = name;
        this.imageData = imageData;
        this.imageFileName = imageFileName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

}

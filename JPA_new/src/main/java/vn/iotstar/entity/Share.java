package vn.iotstar.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Shares database table.
 * 
 */
@Entity
@Table(name="Shares")
@NamedQuery(name="Share.findAll", query="SELECT s FROM Share s")
public class Share implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ShareId")
	private int shareId;

	@Column(name="Emails")
	private String emails;

	@Column(name="SharedDate")
	private String sharedDate;

	@Column(name="Username")
	private String username;

	@Column(name="VideoId")
	private String videoId;

	public Share() {
	}

	public int getShareId() {
		return this.shareId;
	}

	public void setShareId(int shareId) {
		this.shareId = shareId;
	}

	public String getEmails() {
		return this.emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}

	public String getSharedDate() {
		return this.sharedDate;
	}

	public void setSharedDate(String sharedDate) {
		this.sharedDate = sharedDate;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getVideoId() {
		return this.videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

}
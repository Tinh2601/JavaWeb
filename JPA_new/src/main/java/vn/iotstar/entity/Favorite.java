package vn.iotstar.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Favorites database table.
 * 
 */
@Entity
@Table(name="Favorites")
@NamedQuery(name="Favorite.findAll", query="SELECT f FROM Favorite f")
public class Favorite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="FavoriteId")
	private int favoriteId;

	@Column(name="LikedDate")
	private String likedDate;

	@Column(name="Username")
	private String username;

	@Column(name="VideoId")
	private String videoId;

	public Favorite() {
	}

	public int getFavoriteId() {
		return this.favoriteId;
	}

	public void setFavoriteId(int favoriteId) {
		this.favoriteId = favoriteId;
	}

	public String getLikedDate() {
		return this.likedDate;
	}

	public void setLikedDate(String likedDate) {
		this.likedDate = likedDate;
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
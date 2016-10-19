package com.example.iwtw.domain;

public class Movie {
	
	private String title;
	private int releaseYear;
	private String genre;
	private String coverUrl;
	private boolean isFavorite = false;

	public Movie() {
		super();
	}
	
	public Movie(String title, int releaseYear, String genre, String coverUrl) {
		super();
		
		this.title = title;
		this.releaseYear = releaseYear;
		this.genre = genre;
		this.coverUrl = coverUrl;
	}

	public Movie(String title, int releaseYear, String genre, String coverUrl, boolean isFavorite) {
		super();
		
		this.title = title;
		this.releaseYear = releaseYear;
		this.genre = genre;
		this.coverUrl = coverUrl;
		this.isFavorite = isFavorite;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public int getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCoverUrl() {
		return coverUrl;
	}
	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}

	public boolean getIsFavorite() {
		return isFavorite;
	}

	public void setIsFavorite(boolean isFavorite) {
		this.isFavorite = isFavorite;
	}
}

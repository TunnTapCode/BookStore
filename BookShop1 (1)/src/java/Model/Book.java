/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hoang
 */
public class Book {

    private int id;
    private String title;
    private int price;
    private String image;
    private String author;
    private String name;
    

    public Book() {
    }

    public Book(int id, String title, int price, String image, String author, String name) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.image = image;
        this.author = author;
        this.name = name;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", name=" + name + ", image=" + image + ", title=" + title + ", price=" + price + ", author=" + author + '}';
    }

}

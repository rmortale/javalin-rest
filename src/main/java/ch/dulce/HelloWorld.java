
package ch.dulce;

import io.javalin.Javalin;

public class HelloWorld {
  public static void main(String[] args) {
    Javalin app = Javalin.create().start("0.0.0.0", 7000);
    app.get("/", ctx -> ctx.result("Hello World"));
  }
}

// Pruebas unitarias

bool isValidEmail(String text) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(text);
}

// https://www.youtube.com/watch?v=wgMMlUfxXcg&list=PLV0nOzdUS5Xsj5o9c7HgLqYt7EV9MPOqD&index=4


package sandbox api;

fn Main() -> i32 {
  Print("<!--Carbon File to create a quote-->");
  //HTML File
  var a: String = """HTML
  <!DOCTYPE html>
  <html lang="en">
  <head>
  <title>Quote Generator</title>
  </head>
  <body>
  
    <div class="quote-container" id="quote-container">
      <div class="quote-text">
        <i class="fas fa-quote-left"></i>
          <span id="quote"></span>
      </div>
      <div class="quote-author">
        <span id="author"></span>
      </div>
    </div>
    <script>
  const quoteContainer = document.getElementById('quote-container');
  const quoteText = document.getElementById('quote');
  const authorText = document.getElementById('author');
  async function getQuote() {{
    const proxyUrl = 'https://whispering-tor-04671.herokuapp.com/'
    const apiUrl = 'http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json';
    try {{
      const response = await fetch(proxyUrl + apiUrl);
      const data = await response.json();
      if (data.quoteAuthor === '') {{
        authorText.innerText = 'Unknown';
      } else {{
          authorText.innerText = data.quoteAuthor;
        }
        if (data.quoteText.length > 120) {{
          quoteText.classList.add('long-quote');
        } else {{
          quoteText.classList.remove('long-quote');
        }
        quoteText.innerText = data.quoteText;
    } catch (error) {{
      getQuote();
    }
  }
  getQuote();
  </script>
  </body>
  </html>
  """;

  Print(a);
  return 0;
}

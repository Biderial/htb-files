from flask import Flask, render_template, request, redirect
from searchor import Engine
import subprocess


app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', options=Engine.__members__, error='')

@app.route('/search', methods=['POST'])
def search():
    try:
        engine = request.form.get('engine')
        query = request.form.get('query')
        auto_redirect = request.form.get('auto_redirect')
        
        if engine in Engine.__members__.keys():
            arg_list = ['searchor', 'search', engine, query]
            r = subprocess.run(arg_list, capture_output=True)
            url = r.stdout.strip().decode()
            if auto_redirect is not None:
                return redirect(url, code=302)
            else:
                return url

        else:
            return render_template('index.html', options=Engine.__members__, error="Invalid engine!")

    except Exception as e:
        print(e)
        return render_template('index.html', options=Engine.__members__, error="Something went wrong!")

if __name__ == '__main__':
    app.run(debug=False)

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{csrf_token()}}">
        <link rel="stylesheet" href="{{url('css/app.css?v='.rand(0,3000))}}" type="text/css">
        <title>Follow Users</title>
    </head>
    <body>
        <div class="container">
            <h1>Follow Users</h1>
            <div id="main-container"></div>
        </div>

        <script src="{{url('js/app.js?v='.rand(0,3000))}}"></script>
    </body>
</html>

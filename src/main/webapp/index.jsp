<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Similar Hotstar</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #050814;
            color: white;
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 40px;
            background: #050814;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #1f80e0;
        }

        .nav-links a {
            margin: 0 15px;
            text-decoration: none;
            color: #d0d0d0;
            font-size: 14px;
        }

        .nav-links a:hover {
            color: #ffffff;
        }

        .hero {
            position: relative;
            height: 320px;
            background: linear-gradient(to right, #050814 20%, #141b2f);
            display: flex;
            align-items: center;
            padding: 40px;
        }

        .hero-content {
            max-width: 40%;
        }

        .hero-title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .hero-meta {
            font-size: 13px;
            color: #c0c0c0;
            margin-bottom: 15px;
        }

        .hero-desc {
            font-size: 14px;
            color: #dcdcdc;
            margin-bottom: 20px;
        }

        .hero-buttons button {
            padding: 10px 22px;
            margin-right: 10px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-watch {
            background-color: #f9f9f9;
            color: #000000;
        }

        .btn-more {
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff;
        }

        .hero-poster {
            position: absolute;
            right: 60px;
            bottom: 0;
            height: 260px;
        }

        .section {
            padding: 20px 40px;
        }

        .section-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card-row {
            display: flex;
            gap: 14px;
            overflow-x: auto;
        }

        .card {
            min-width: 150px;
            background-color: #141b2f;
            border-radius: 8px;
            overflow: hidden;
            flex-shrink: 0;
        }

        .card img {
            width: 100%;
            display: block;
        }

        .card-body {
            padding: 8px;
            font-size: 13px;
        }

        .card-title {
            font-weight: 600;
            margin-bottom: 4px;
        }

        .card-meta {
            font-size: 11px;
            color: #aaaaaa;
        }

        ::-webkit-scrollbar {
            height: 6px;
        }

        ::-webkit-scrollbar-thumb {
            background: #333a52;
            border-radius: 3px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="logo">SimilarHotstar</div>
    <div class="nav-links">
        <a href="#">TV</a>
        <a href="#">Movies</a>
        <a href="#">Sports</a>
        <a href="#">Disney+</a>
        <a href="#">Kids</a>
        <a href="#">NFL</a>
    </div>
</div>

<div class="hero">
    <div class="hero-content">
        <div class="hero-title">Featured Show Title</div>
        <div class="hero-meta">Drama • 2024 • 2 Seasons • 4K</div>
        <div class="hero-desc">
            A sample description for your Hotstar-like clone UI. Replace this text with your own content or
            dynamic description later when you add backend logic.
        </div>
        <div class="hero-buttons">
            <button class="btn-watch">▶ Watch</button>
            <button class="btn-more">ℹ More Info</button>
        </div>
    </div>

    <!-- Placeholder poster (you can replace src with any image URL) -->
    <img class="hero-poster"
         src="https://via.placeholder.com/300x260.png?text=Poster"
         alt="Featured Poster">
</div>

<div class="section">
    <div class="section-title">Trending Now</div>
    <div class="card-row">
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Movie+1" alt="Movie 1">
            <div class="card-body">
                <div class="card-title">Movie 1</div>
                <div class="card-meta">Action • 2023</div>
            </div>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Movie+2" alt="Movie 2">
            <div class="card-body">
                <div class="card-title">Movie 2</div>
                <div class="card-meta">Drama • 2022</div>
            </div>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Movie+3" alt="Movie 3">
            <div class="card-body">
                <div class="card-title">Movie 3</div>
                <div class="card-meta">Comedy • 2021</div>
            </div>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Movie+4" alt="Movie 4">
            <div class="card-body">
                <div class="card-title">Movie 4</div>
                <div class="card-meta">Thriller • 2024</div>
            </div>
        </div>
    </div>
</div>

<div class="section">
    <div class="section-title">Latest &amp; Trending</div>
    <div class="card-row">
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Show+1" alt="Show 1">
            <div class="card-body">
                <div class="card-title">Show 1</div>
                <div class="card-meta">Series • 10 Episodes</div>
            </div>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Show+2" alt="Show 2">
            <div class="card-body">
                <div class="card-title">Show 2</div>
                <div class="card-meta">Series • 8 Episodes</div>
            </div>
        </div>
        <div class="card">
            <img src="https://via.placeholder.com/300x170.png?text=Show+3" alt="Show 3">
            <div class="card-body">
                <div class="card-title">Show 3</div>
                <div class="card-meta">Series • 5 Episodes</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

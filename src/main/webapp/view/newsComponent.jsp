<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/page/news.css">
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Raleway:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous"></script>
</head>
<body>
<section class = "banner">
    <div class = "banner-main-content">
        <div class = "current-news-head">
            <h3>The Leopard : Cái đẹp khó cưỡng lại của sự điêu tàn <span>by linhhuy0257</span></h3>
            <h3>What's it's like to have Elon Musk's old phone number <span>by abrar al-heeti</span></h3>
            <h3>Watch the exact moment Chris Pratt accidentally deletes 51, 000 emials <span>by goel fashingbauer</span></h3>
        </div>
    </div>

    <div class = "banner-sub-content">

        <div class = "hot-topic">
            <img src = "assets/images/banner-news-1.jpg" alt = "">

            <div class = "hot-topic-content">
                <h2>Twitter's New Retweet With Comment Counter Is Now Available On Andriod & Web</h2>

                <h3>New Topic 1</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore consequatur nostrum minus iusto fugit unde.</p>
                <a href = "#">Read More</a>
            </div>
        </div>

        <div class = "hot-topic">
            <img src = "assets/images/banner-news-2.jpg" alt = "">

            <div class = "hot-topic-content">
                <h2>Twitter's New Retweet With Comment Counter Is Now Available On Andriod & Web</h2>

                <h3>New Topic 1</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore consequatur nostrum minus iusto fugit unde.</p>
                <a href = "#">Read More</a>
            </div>
        </div>

        <div class = "hot-topic">
            <img src = "assets/images/banner-news-3.jpg" alt = "">

            <div class = "hot-topic-content">
                <h2>Twitter's New Retweet With Comment Counter Is Now Available On Andriod & Web</h2>

                <h3>New Topic 1</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore consequatur nostrum minus iusto fugit unde.</p>
                <a href = "#">Read More</a>
            </div>
        </div>

        <div class = "hot-topic">
            <img src = "assets/images/banner-news-4.jpg" alt = "">

            <div class = "hot-topic-content">
                <h2>Twitter's New Retweet With Comment Counter Is Now Available On Andriod & Web</h2>

                <h3>New Topic 1</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore consequatur nostrum minus iusto fugit unde.</p>
                <a href = "#">Read More</a>
            </div>
        </div>

    </div>
</section>
    <main>
        <section class = "main-container-right">
            <article>
                <h4>just in </h4>
                <div>
                    <h2>Here's how to track your stimulus check with the IRS Get My Payment Portal</h2>

                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, repellendus?</p>

                    <a href = "#">Read More <span>>></span></a>
                </div>
                <img src = "assets/images/right-1.jpg">
            </article>
            <article>
                <h4>just in </h4>
                <div>
                    <h2>The best outdoor games to play with your family</h2>

                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, repellendus?</p>

                    <a href = "#">Read More <span>>></span></a>
                </div>
                <img src = "assets/images/right-2.jpg">
            </article>
            <article>
                <h4>just in </h4>
                <div>
                    <h2>Why walk? Check out the best electric scooters and e-bikes for 2020</h2>

                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, repellendus?</p>

                    <a href = "#">Read More <span>>></span></a>
                </div>
                <img src = "assets/images/right-3.jpg">
            </article>
            <article>
                <h4>just in </h4>
                <div>
                    <h2>Disneyland Paris will stream its Lion King stage show Friday night</h2>

                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, repellendus?</p>

                    <a href = "#">Read More <span>>></span></a>
                </div>
                <img src = "assets/images/right-4.jpg">
            </article>
            <article>
                <h4>just in </h4>
                <div>
                    <h2>Looking at a phone's lock screen also requries a warrant, judge rules</h2>

                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id, repellendus?</p>

                    <a href = "#">Read More <span>>></span></a>
                </div>
                <img src = "assets/images/right-5.jpg">
            </article>
        </section>
    </main>

<script async defer>

    const btnHam = document.querySelector('.ham-btn');
    const btnTimes = document.querySelector('.times-btn');
    const navBar = document.getElementById('nav-bar');

    btnHam.addEventListener('click', function(){
        if(btnHam.className !== ""){
            btnHam.style.display = "none";
            btnTimes.style.display = "block";
            navBar.classList.add("show-nav");
        }
    })

    btnTimes.addEventListener('click', function(){
        if(btnHam.className !== ""){
            this.style.display = "none";
            btnHam.style.display = "block";
            navBar.classList.remove("show-nav");
        }
    })
</script>
</body>
</html>
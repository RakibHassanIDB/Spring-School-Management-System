<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>SMS -->Login Page</title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/login.css">
        <script src="resources/js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">        

    </head>
    <body>
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header-logo"><center><img style="width: 180px; height: 100px;" src="resources/images/logo/schoollogo.png"/></center></div>               
                <div class="card-header">Login to Continue</div>
                <div class="card-body">
                    <form action="perform_login" method="post">
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus" name="usename">
                            </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" name="userpassword">
                            </div>
                            </div>
                        </di
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me">
                                    Remember Password
                                </label>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary btn-block" value="Login"></input>
                        <a class="btn btn-outline-dark btn-block" href="<%=request.getContextPath() %>">Home</a>
                    </form>
                    <div class="form-group">
                        <div class="sign">
                            <a class="d-block small mt-3 checkbox" href="signup" style="display:inline-block">Don't have an account? <span>Create</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="resources/js/sketch.min.js"></script>
        <script>

            // ----------------------------------------
            // Particle
            // ----------------------------------------

            function Particle(x, y, radius) {
                this.init(x, y, radius);
            }

            Particle.prototype = {

                init: function (x, y, radius) {

                    this.alive = true;

                    this.radius = radius || 10;
                    this.wander = 0.15;
                    this.theta = random(TWO_PI);
                    this.drag = 0.92;
                    this.color = '#fff';

                    this.x = x || 0.0;
                    this.y = y || 0.0;

                    this.vx = 0.0;
                    this.vy = 0.0;
                },

                move: function () {

                    this.x += this.vx;
                    this.y += this.vy;

                    this.vx *= this.drag;
                    this.vy *= this.drag;

                    this.theta += random(-0.5, 0.5) * this.wander;
                    this.vx += sin(this.theta) * 0.1;
                    this.vy += cos(this.theta) * 0.1;

                    this.radius *= 0.96;
                    this.alive = this.radius > 0.5;
                },

                draw: function (ctx) {

                    ctx.beginPath();
                    ctx.arc(this.x, this.y, this.radius, 0, TWO_PI);
                    ctx.fillStyle = this.color;
                    ctx.fill();
                }
            };

            // ----------------------------------------
            // Example
            // ----------------------------------------

            var MAX_PARTICLES = 280;
            var COLOURS = ['#69D2E7', '#A7DBD8', '#E0E4CC', '#F38630', '#FA6900', '#FF4E50', '#F9D423'];

            var particles = [];
            var pool = [];

            var demo = Sketch.create({
                container: document.getElementById('container'),
                retina: 'auto'
            });

            demo.setup = function () {

                // Set off some initial particles.
                var i, x, y;

                for (i = 0; i < 20; i++) {
                    x = (demo.width * 0.5) + random(-100, 100);
                    y = (demo.height * 0.5) + random(-100, 100);
                    demo.spawn(x, y);
                }
            };

            demo.spawn = function (x, y) {

                var particle, theta, force;

                if (particles.length >= MAX_PARTICLES)
                    pool.push(particles.shift());

                particle = pool.length ? pool.pop() : new Particle();
                particle.init(x, y, random(5, 40));

                particle.wander = random(0.5, 2.0);
                particle.color = random(COLOURS);
                particle.drag = random(0.9, 0.99);

                theta = random(TWO_PI);
                force = random(2, 8);

                particle.vx = sin(theta) * force;
                particle.vy = cos(theta) * force;

                particles.push(particle);
            };

            demo.update = function () {

                var i, particle;

                for (i = particles.length - 1; i >= 0; i--) {

                    particle = particles[i];

                    if (particle.alive)
                        particle.move();
                    else
                        pool.push(particles.splice(i, 1)[0]);
                }
            };

            demo.draw = function () {

                demo.globalCompositeOperation = 'lighter';

                for (var i = particles.length - 1; i >= 0; i--) {
                    particles[i].draw(demo);
                }
            };

            demo.mousemove = function () {

                var particle, theta, force, touch, max, i, j, n;

                for (i = 0, n = demo.touches.length; i < n; i++) {

                    touch = demo.touches[i], max = random(1, 4);
                    for (j = 0; j < max; j++) {
                        demo.spawn(touch.x, touch.y);
                    }

                }
            };

        </script>
    </body>
</html>

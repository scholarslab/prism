// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//

/*

Built as part of @seb_ly's two-day Creative JavaScript class:
http://creativejs.com/
http://sebleedelisle.com/training/

October 18, 2011 by Jim Webb, jim@snacksize.com

This includes lots of @seb_ly's code. Thanks.

*/

function unicorn() {
					
	// screen size variables
	var	SCREEN_WIDTH = window.innerWidth,
		SCREEN_HEIGHT = window.innerHeight,
		HALF_WIDTH = window.innerWidth / 2,
		HALF_HEIGHT = window.innerHeight / 2;

	// mouse variables
	var	mouseX = HALF_WIDTH, 
		mouseY = HALF_HEIGHT, 
		mouseVelX = 0, 
		mouseVelY = 0, 
		lastMouseX = mouseX, 
		lastMouseY = mouseY,
		mouseDown = false,
		
		canvas = document.createElement( 'canvas' );
		c = context = canvas.getContext( '2d' );				
		ucanvas = document.createElement( 'canvas' );
		uc = ucanvas.getContext( '2d' );				
		
		
	// particle variables
	var	particles = [],
		MAX_PARTICLES = 250,
		NUM_PARTICLES = 2;
	
	// unicorn variables
	var	unicornImage = new Image();
		unicornImage.src = 'http://snacksize.com/unicorn/unicorn.png';
	var	unicorn = new ImageParticle(unicornImage, HALF_WIDTH, HALF_HEIGHT); 
		unicorn.width = 115;
		unicorn.xoffset = 30;
		unicorn.yoffset = 50;
	
	// rainbow hues
	var rainbow = [0,51,103,154,206,257,309];

	// our one icky global variable, only used on snacksize.com
	unicorn_noclick = false;
		
	this.init = function() {

		// CANVAS SET UP
	
		document.body.appendChild(canvas); 
		canvas.width = SCREEN_WIDTH; 
		canvas.height = SCREEN_HEIGHT;
		
		document.body.appendChild(ucanvas); 
		ucanvas.width = SCREEN_WIDTH; 
		ucanvas.height = SCREEN_HEIGHT;
		
		canvas.style.position = "absolute";
		canvas.style.top = 0;
		canvas.style.left = 0;
		canvas.style.zIndex = 9998;
		ucanvas.style.position = "absolute";
		ucanvas.style.top = 0;
		ucanvas.style.left = 0;
		ucanvas.style.zIndex = 9999;

		initMouseListeners(); 
		document.body.style.cursor = 'none';

		setInterval(loop, 1000 /30);
			
		// If google analytics is already here, let's phone home.
		// I'm not gonna inject GA's js, though. That's rude.
		
		if (window.location.hostname.indexOf("snacksize.com") == -1) {
		
			try {
				_gaq.push(['t2._setAccount', 'UA-343108-1']);
				_gaq.push(['t2._setDomainName', 'snacksize.com']);
				_gaq.push(['t2._trackEvent','unicorn-bookmarklet','fired',window.location.href]);
			} catch(e) {}
		
		}
		

	}

	
	//
	
	function loop() {
	
		// clear the canvas
		uc.clearRect(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);

		mouseVelX = mouseX-lastMouseX; 
		mouseVelY = mouseY-lastMouseY; 
		lastMouseX = mouseX; 
		lastMouseY = mouseY;				
		
		// make some particles
		if (mouseDown) {
			makeParticle(NUM_PARTICLES);		
		}

		// iterate through each particle
		for (i=0; i<particles.length; i++) {
			var particle = particles[i]; 
			
			// if it's off the screen, don't bother
			if (particle.posY > SCREEN_HEIGHT) continue;
			
			particle.update();			
			
			// render it
			particle.render(particle.context); 						
		}
		
		// Keep taking the oldest particles away until we have 
		// fewer than the maximum allowed. 
		
		while(particles.length>MAX_PARTICLES) {
			particles.shift(); 
		}
		
		// draw the unicorn last so it'll be on top
		// have the unicorn follow the cursor
		// adjust the position to account for the unicorn's head				

		unicorn.posX=mouseX - unicorn.xoffset;
		unicorn.posY=mouseY + unicorn.yoffset;
		
		uc.save();
		
		// flip the unicorn based on the mouse velocity
		if (mouseVelX < 0) unicorn.facing = "left";
		if (mouseVelX > 0) unicorn.facing = "right";
		
		if (unicorn.facing == "left") {
			// facing left
			uc.scale(-1,1);
			unicorn.posX=-unicorn.posX;
		}
		
		// draw unicorn
		unicorn.render(uc);
		
		uc.restore();
		
	}
	
	function makeParticle(particleCount) {
	
		for(var i=0; i<particleCount;i++) {
			
			// create a new particle in the middle of the stage
			
			var percentage = (i+1) / NUM_PARTICLES;
			var newX = (mouseVelX * percentage) + lastMouseX;
			var newY = (mouseVelY * percentage) + lastMouseY;
			
			// create poop particle; offset 
			var particle = new ImageParticle(false, newX+(unicorn.facing=="right" ? -unicorn.width+unicorn.xoffset : unicorn.xoffset), newY); 

			// spraying horizontally from butt
			particle.velX = (unicorn.facing == "right" ? randomRange(-10,-17) : randomRange(10,17) ) -  (mouseVelX*0.15) ;
			
			// gently moving downward
			particle.velY = randomRange(-1,8) -  (mouseVelY*0.1) ;
						
			// random sizes
			particle.size = randomRange(3,5);

			// random colors, but only rainbow colors
			particle.h = rainbow[Math.floor(Math.random()*rainbow.length)];
			particle.s = 100;
			particle.l = 50;
			
			particle.alpha = 1;
			particle.gravity = 0.4; 
			particle.drag = 0.97;
			particle.shrink = 0.99; 
			//particle.shimmer = true; 
			particle.context = c;
			
			// particle.compositeOperation = 'lighter'; 

			particles.push(particle);

		
			// spray a sparkle every other particle
			
			if (i % 2 == 0) {
				var sparkle = new ImageParticle(false, newX+(unicorn.facing=="right" ? -unicorn.width+unicorn.xoffset : unicorn.xoffset), newY+2);
				
				sparkle.velX = (unicorn.facing == "right" ? randomRange(-10,-17) : randomRange(10,17) ) -  (mouseVelX*0.15) ;
				sparkle.velY = randomRange(-1,3) -  (mouseVelY*0.1) ;
				
				sparkle.size = 4;
						
				sparkle.h = 0;
				sparkle.s = 0;
				sparkle.l = 100;
				
				sparkle.alpha = 1;
				sparkle.fade = 0.03;
				sparkle.gravity = 0; 
				sparkle.drag = 0.99;
				sparkle.shrink = 0.99; 
				sparkle.shimmer = true; 
				
				// sparkle.compositeOperation = 'lighter'; 
				sparkle.context = uc;
				
				// add it to the array	
				particles.push(sparkle);
			}
							
		}		
	
	}
		
	function initMouseListeners() {
		document.addEventListener('mousemove', onMouseMove, false);
		document.addEventListener( 'mousedown', onMouseDown, false );
		document.addEventListener( 'mouseup', onMouseUp, false );
	}

	function onMouseMove( event ) {
		event.preventDefault();
		mouseX = event.clientX;
		mouseY = event.clientY;
	}

	function onMouseDown(event) {
		if (!unicorn_noclick) mouseDown = true; 
	}
	function onMouseUp(event) {
		unicorn_noclick = false;
		mouseDown = false; 
	}


	var TO_RADIANS = Math.PI / 180; 

	function ImageParticle(img, posx, posy) {

		// the position of the particle
		this.posX = posx; 
		this.posY = posy; 
		// the velocity 
		this.velX = 0; 
		this.velY = 0; 
		
		
		// color, if it's not an image
		// define as hsl
		
		this.h = 255;
		this.s = 50;
		this.l = 50;
		this.radius = 2;
		
		// multiply the particle size by this every frame
		this.shrink = 1; 
		this.size = 1; 
		// if maxSize is a positive value, limit the size of 
		// the particle (this is for growing particles).
		this.maxSize = -1;
		
		// if true then make the particle flicker
		this.shimmer = false;	

		// multiply the velocity by this every frame to create
		// drag. A number between 0 and 1, closer to one is 
		// more slippery, closer to 0 is more sticky. values
		// below 0.6 are pretty much stuck :) 
		this.drag = 1; 
		
		// add this to the yVel every frame to simulate gravity
		this.gravity = 0; 
		
		// current transparency of the image
		this.alpha = 1; 
		// subtracted from the alpha every frame to make it fade out
		this.fade = 0; 

		// the amount to rotate every frame
		this.spin = 0; 
		// the current rotation
		this.rotation = 0; 
		
		// the blendmode of the image render. 'source-over' is the default
		// 'lighter' is for additive blending.
		this.compositeOperation = 'source-over';

		// the image to use for the particle. 
		this.img = img; 

		this.update = function() {
		
			// simulate drag
			this.velX *= this.drag; 
			this.velY *= this.drag;
			
			// add gravity force to the y velocity 
			this.velY += this.gravity; 
			
			// and the velocity to the position
			this.posX += this.velX;
			this.posY += this.velY; 
			
			// shrink the particle
			this.size *= this.shrink;
			// if maxSize is set and we're bigger, resize!
			if((this.maxSize>0) && (this.size>this.maxSize))
				this.size = this.maxSize; 
			
			// and fade it out
			this.alpha -= this.fade; 	
			if(this.alpha<0) this.alpha = 0; 
			
			// rotate the particle by the spin amount. 
			this.rotation += this.spin; 
		 
		};
		
		this.render = function(c) {
		
			// if we're fully transparent, no need to render!
			if(this.alpha ==0) return;
			
			// save the current canvas state
			c.save(); 
			
			// move to where the particle should be
			c.translate(this.posX, this.posY);
			
			// scale it dependent on the size of the particle
			var s = this.shimmer ? this.size * Math.random() : this.size; //this.shimmer ? this.size * 0 : this.size; 
			c.scale(s,s);
			
			// and rotate
			c.rotate(this.rotation * TO_RADIANS);
							
			// move the draw position to the center of the image
			if (img) c.translate(img.width*-0.5, img.width*-0.5);
			
			// set the alpha to the particle's alpha
			c.globalAlpha = this.alpha; 
			
			// set the composition mode
			c.globalCompositeOperation = this.compositeOperation;
					
			// and draw it! 
			if (img != false) { 
				c.drawImage(img,0,0);
				}
			else {
				// it's not an image; draw a circle
				c.fillStyle = "hsl("+this.h+","+this.s+"%,"+this.l+"%)";

				c.beginPath();
				c.arc(0,0, this.radius, 0, Math.PI*2, true);
				c.closePath();
			
				// and fill it
				c.fill();
			};
			// and restore the canvas state
			c.restore();
						
		};


	}


	function randomRange(min, max) {
		return ((Math.random()*(max-min)) + min); 
	}
	
	this.addEvent = function(obj, evType, fn){ 
		 if (obj.addEventListener){ 
		   obj.addEventListener(evType, fn, false); 
		   return true; 
		 } else if (obj.attachEvent){ 
		   var r = obj.attachEvent("on"+evType, fn); 
		   return r; 
		 } else { 
		   return false; 
		 } 
		}



	}

// Let's do it

//if (typeof uni == "undefined") {
  //var uni = new unicorn();
  //if (document.readyState === "complete") {
    //uni.init();
  //} else { 
    //uni.addEvent(window, 'load', uni.init);
  //}
//}


$(document).ready(function(){
  var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
  $(document).keydown(function(e) {
    kkeys.push( e.keyCode );
    if ( kkeys.toString().indexOf( konami ) >= 0 ){
      $(document).unbind('keydown',arguments.callee);
     var uni = new unicorn();
  if (document.readyState === "complete") {
    uni.init();
  } else { 
    uni.addEvent(window, 'load', uni.init);
  }
      console.log('fired');
    }
});
});

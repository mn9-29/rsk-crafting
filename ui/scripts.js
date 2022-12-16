var options = undefined;
var hasCreatedButtons = false;
var hasCreatedButtons2 = false;
var hasCreatedButtons3 = false
var canSelect = true
var canSelect2 = true
var canSelect3 = true
var canSelect4 = true
var canSelect5 = true

var taletscolors = {

	"crafter": "#DAD221",

}

window.addEventListener('message', function(event) {
	for (let i = 0; i < 73; i++) {
		if(i <= 73){
			$(".weapon"+i).hide();
		}
	}
	$(".takeitnow").css("display","none");
	$('.classeschose').css("display","none");
	$('.treeofclass').css("display","none");
	$('.actived').css("display", "block");
	hasCreatedButtons = false
	canopentalent = false
	item = event.data;
	switch (event.data.action) {
		case 'openCrafting':
			items = item.items;
			level = item.level;
			typx = item.typx
			imagesize1 = item.imagesize1
			imagesize2 = item.imagesize2
			color1 = item.color1
			color2 = item.color2
			mylevel = item.craftpoint
			shared = item.shared
			expert = item.expert

			$(".weaponinfo").css("animation", "slidein ease 0.4s 1 0.2s forwards");
			$(".craftnow").css("background", color1);
			$(".closereq").css("color", color1);
			$(".craft::-webkit-scrollbar-thumb").css("background-color", color1);
			$(".itemprice").css("color", color2);
			$(".craftnow").mouseover(function () {
				$(".craftnow").css('box-shadow', "0px 0px 10px 0px "+color1+"");
				$(".craftnow").css('background', color1);
			}).mouseout(function () {
				$(".craftnow").css('box-shadow', "0px 0px 0px 0px "+color1+"");
				$(".craftnow").css('background', color1);
			});
			if (typx == 'items'){
				$(".crafttp").html("CRAFT");
			}else{
				$(".crafttp").html("CRAFT");
			}

			for (let i = 0; i < 72; i++) {
				if(i <= 72){
					$(".weapon"+i).hide();
				}
			}

			for (let i = 0; i < items.length; i++) {
				if(i <= 100){
					xid = i + 1
					itemname = items[i].item
					$(".weapon"+xid).show();
					$(".weapon"+xid).attr('id', items[i].Level);
					$(".weapon"+xid+"> .itemname").html(shared[items[i].item].label);

					if(mylevel >= items[i].Level || expert == true )    {
						$(".weapon"+xid+"> .itemname").html(shared[items[i].item].label);
					}else{
						$(".weapon"+xid+"> .itemname").html('LOCKED ITEM');
					}
					
					if(mylevel >= items[i].Level ||expert == true )    {
						$(".weapon"+xid+"> .itemprice").html("LVL "+items[i].Level);
					}else{
						$(".weapon"+xid+"> .itemprice").html("?? LVL");
					}

					if (typx == 'items'){
						$(".weapon"+xid+"> .stylimgg > .itemimg").width(imagesize2)
					}else{
						$(".weapon"+xid+"> .stylimgg > .itemimg").width(imagesize1)
					}

					
					if(mylevel >= items[i].Level ||expert == true )    {
						$(".weapon"+xid+"> .stylimgg > .itemimg").attr("src", "nui://qr-inventory/html/images/"+shared[items[i].item].image)
						$(".weapon"+xid+"> .stylimgg > .itemimg").width(imagesize2)
					}else{
						$(".weapon"+xid+"> .stylimgg > .itemimg").attr("src", "nui://qr-inventory/html/images/lockicon.png")
						$(".weapon"+xid+"> .stylimgg > .itemimg").width(imagesize2)
					}

					if(mylevel >= items[i].Level){
						$(".weapon"+xid+"> .creatinfo").css("display","block");



					}else{
						$(".weapon"+xid+"> .creatinfo").css("display","none");

					}


					$(".craft").attr('id', typx);
					if(!hasCreatedButtons2){


						
						$(document).on('click', ".weapon"+xid+"> .creatinfo", function() {
							if(canSelect2){
								for (let r = 0; r < 9; r++) {
									if(r <= 9){
										$(".webre"+r).hide();
									}
								}
								delay = 1
								var right = $(".weaponinfo").css("right");
								if(right == "32.4px"){
									$(".weaponinfo").css("animation", "slideout ease 0.2s 1 0s forwards");
									delay = 300;
								}
								setTimeout(function (){
									// Code to run here
								canSelect2 = false
								for (let x = 0; x < items[i].Ingredients.length; x++) {
									if(x <= 9){
										sddfs = x + 1
										$(`.webre${sddfs}`).html(' <img src="nui://qr-inventory/html/images/'+shared[items[i].Ingredients[x].item].image+'" style="width: 30px; position: absolute; left: 1vh;"> '+items[i].Ingredients[x].amount+"x "+shared[items[i].Ingredients[x].item].label);
										$(".webre"+sddfs).show();
									}
								}
								$(".theitemname").html(shared[items[i].item].label);
								$(".wtext1").html("LVL "+items[i].Level);
								if(typx == 'weapons'){
									$(".wtext2").html("This weapon is "+items[i].info+", it will increase you "+items[i].ExperiancePerCraft+" points, It needs "+items[i].Ingredients.length+" pieces");
								}else{
									$(".wtext2").html("This item is "+items[i].info+", it will increase you "+items[i].ExperiancePerCraft+" points, It needs "+items[i].Ingredients.length+" pieces");
								}
								$(".theitemname").attr('id', i);
								$(".reqq").attr('id', items[i].item);
								$(".weaponinfo").attr('id', items[i].Level);
								$(".weaponinfo").show();
								$(".weaponinfo").css("animation", "slidein ease 0.4s 1 0.2s forwards");
									setTimeout(function(){
										clicking.xswitch();
									}, 250);
								setTimeout(function(){
									canSelect2 = true
								}, 1000);
								}, delay)
							}
						});
					}
				}
			}
			hasCreatedButtons2 = true
			$('.craftermenu').fadeIn();

			break;
		case 'openDialog':
			options = item.options;
			cardheight = item.cardheight
			$(".dialogbox").css('top','40vh');
			pedname = item.name
			$('.npc-subject').html(item.header);
			$('#dialog').html(item.dialog);
			if(cardheight){
				$(".card").css('height', cardheight);
			}else{
				$(".card").css('height', '8vh');
			}
			if(item.options.length == 0){
				for (let i = 0; i < 7; i++) {
					$(".option"+i).hide();
				}
			}
			for (let i = 0; i < item.options.length; i++) {
				if(i <= 7){
					$(".option"+i).show();
					$("#option"+i).html(item.options[i][0]);
					if(!hasCreatedButtons){
						$(document).on('click', ".option"+i, function() {
							if(canSelect){
								canSelect = false
								$.post('https://rsk-crafting/action', JSON.stringify ({
									action: "option",
									options: options[i],
								}));
								$('.talkwithbot').fadeOut();
								clicking.longpop();
								setTimeout(function(){
									canSelect = true
								}, 1000);
							}
						});
					}
				}
				if(i < 7){
					for (let i = item.options.length; i < 7; i++){
						$(".option"+i).hide();
					}
				}
			}
			hasCreatedButtons = true
			$('.talkwithbot').fadeIn();
		break
	}
});

var aud = document.getElementById("bosstalking");
aud.onended = function() {
	$.post('https://rsk-crafting/action', JSON.stringify ({
		action: "stoptalking",
	}));
};

$(document).on('click', ".closeinterface", function() {
	$('.talkwithbot').fadeOut();
	$('.craftermenu').fadeOut();
	$('.confirmclass').fadeOut();
	$(".weaponinfo").hide();
	$('.blockrigth').css('pointer-events', "auto");
	$('.blockrigth').css('filter', "blur(0px)");
	hasCreatedButtons = false
	hasCreatedButtons2 = false
	clicking.longpop();
	$.post('https://rsk-crafting/action', JSON.stringify ({
		action: "closeui",
		pedname: pedname
	}));
});


$(document).on('click', ".closereq", function() {
	$(".weaponinfo").css("animation", "slideout ease 0.4s 1 0s forwards");
});

$(document).on('click', ".closeblock", function() {
	if(whatis == 2){
		$(".blocktitle").html("Specializations");
		$(".blocktitle").attr('id', "Specializations");
		$('.treeofclass').css("display","none");
		$('.classeschose').fadeIn();
		whatis = 1
	}else{
		$(".blockrigth").css("animation", "slideoutb ease 0.4s 1 0s forwards");
		$.post('https://rsk-crafting/action', JSON.stringify({
			action: "close",
		}));
	}
});

$(document).on('click', ".closetheconfirm", function() {
	$('.blockrigth').css('pointer-events', "auto");
	$('.blockrigth').css('filter', "blur(0px)");
	$('.confirmclass').fadeOut();
	setTimeout(function(){
		$('.actived > .thetext').html("ACTIVE");
		$('.actived').css("right", "14.9vh");
	}, 1000);
});



$(document).on('click', ".actived", function() {
	var xtheid = $('.confirmclass').attr('id')
	if(xtheid == 'closed'){
		$('.blockrigth').css('pointer-events', "auto");
		$('.blockrigth').css('filter', "blur(0px)");
		$('.confirmclass').fadeOut();
		setTimeout(function(){
			$('.actived > .thetext').html("ACTIVE");
			$('.actived').css("right", "14.9vh");
		}, 1000);
	}else{
		var theid = $('.confirmclass').attr('id') + 1
		var plypoints = 0
		var tresult = theid.includes("class-");
		if(theid){
			if(tresult){
				firstclassname = theid.replace("class-", "")
				theclassname = firstclassname.replace("1", "")
				clicking.achve();
				$.post('https://rsk-crafting/action', JSON.stringify({
					action: "iwantthisclass",
					class: theclassname,
				}));
				$.post('https://rsk-crafting/action', JSON.stringify({
					action: "close",
				}));
				
	
				$('.confirmclass').fadeOut();
				$('.blockrigth').css('filter', "blur(0px)");
				$('.blockrigth').css('pointer-events', "auto");
				$('.blockrigth').fadeOut();
			}else{
				var sdfs = theid - 1
				$.post('http://rsk-crafting/GetPlayerInfo', JSON.stringify({}), function(datax){
					plypoints = datax.missionpoint
					var item = playertalents[xtheid]
					if(plypoints >= item.level){
						if(datax.cash >= item.money){
							$('.confirmclass').attr('id', 'closed');
							$.post('https://rsk-crafting/action', JSON.stringify({
								action: "getaward",
								theid: xtheid,
								level: plypoints,
							}));
							$('.actived > .thetext').html("ACTIVATED");
							$('.actived').css("right", "13.4vh");
							clicking.achve();
							$.post('https://rsk-crafting/action', JSON.stringify({
								action: "sendmessage",
								img: "",
								msg: "Congratulations, you have successfully unlocked the award",
							}));
						}else{
							clicking.failed();
							$.post('https://rsk-crafting/action', JSON.stringify({
								action: "sendmessage",
								img: "",
								msg: "Please check your money",
							}));
						}
					}else{
						clicking.failed();
						$.post('https://rsk-crafting/action', JSON.stringify({
							action: "sendmessage",
							img: "",
							msg: "Please check your level",
						}));
					}
				});
			}
	
		}else{
			clicking.failed();
		}
	}
});


$(document).on('click', ".craftnow", function() {
	if(canSelect3){
		canSelect3 = false
			var thetype = $('.craft').attr('id')
			var theitem = $('.theitemname').attr('id')
			var thelvel = $('.weaponinfo').attr('id')
			if (mylevel >= thelvel){
				$.post('https://rsk-crafting/action', JSON.stringify({
					action: "crafting",
					typx: thetype,
					item: theitem,
				}));
				clicking.achve();
			}else{
				clicking.failed();
			}
		setTimeout(function(){
			canSelect3 = true
		}, 2700);
	}else{
		clicking.failed();
	}
});


$(".arrow-left").mouseover(function() {
   var mouse = document.getElementById("mouse");
   mouse.volume = 0.4;
   mouse.play();
});

$(".creatinfo").mouseover(function() {
	var mouse = document.getElementById("mouse");
	mouse.volume = 0.4;
	mouse.play();
 });

clicking = {}
clicking.xswitch = function () {
	var xswitch = document.getElementById("switch");
	xswitch.volume = 0.2;
	xswitch.play();
}
clicking.achve = function () {
	var achve = document.getElementById("achve");
	achve.volume = 0.3;
	achve.play();
}
clicking.failed = function () {
	var failed = document.getElementById("failed");
	failed.volume = 0.3;
	failed.play();
}
clicking.longpop = function () {
	var longpop = document.getElementById("longpop");
	longpop.volume = 0.2;
	longpop.play();
}




$(".actived").mouseover(function () {
	$(".actived").css('box-shadow', "0px 0px 10px 0px rgb(0 0 0)");
	$(".actived").css('background', "rgb(0 0 0 / 78%)");
}).mouseout(function () {
	$(".actived").css('box-shadow', "0px 0px 0px 0px rgb(0 0 0)");
	$(".actived").css('background', "rgb(0 0 0 / 78%)");
});



$(".class1").hover(function(){
	var mouse = document.getElementById("mouse");
	$('.class1 > .classbutton > .classnameback').css('left', '33px');
	$('.class1 > .classimgsffect > img').css('display', 'block');
	mouse.volume = 0.4;
	mouse.play();
}, function(){
	$('.class1 > .classbutton > .classnameback').css('left', '400px');
	$('.class1 > .classimgsffect > img').css('display', 'none');
});

$(".class2").hover(function(){
	var mouse = document.getElementById("mouse");
	$('.class2 > .classbutton > .classnameback').css('left', '33px');
	$('.class2 > .classimgsffect > img').css('display', 'block');
	mouse.volume = 0.4;
	mouse.play();
}, function(){
	$('.class2 > .classbutton > .classnameback').css('left', '400px');
	$('.class2 > .classimgsffect > img').css('display', 'none');
});

$(".class3").hover(function(){
	var mouse = document.getElementById("mouse");
	$('.class3 > .classbutton > .classnameback').css('left', '33px');
	$('.class3 > .classimgsffect > img').css('display', 'block');
	mouse.volume = 0.4;
	mouse.play();
}, function(){
	$('.class3 > .classbutton > .classnameback').css('left', '400px');
	$('.class3 > .classimgsffect > img').css('display', 'none');
});

$(".class4").hover(function(){
	var mouse = document.getElementById("mouse");
	$('.class4 > .classbutton > .classnameback').css('left', '33px');
	$('.class4 > .classimgsffect > img').css('display', 'block');
	mouse.volume = 0.4;
	mouse.play();
}, function(){
	$('.class4 > .classbutton > .classnameback').css('left', '400px');
	$('.class4 > .classimgsffect > img').css('display', 'none');
});

$(".class5").hover(function(){
	var mouse = document.getElementById("mouse");
	$('.class5 > .classbutton > .classnameback').css('left', '33px');
	$('.class5 > .classimgsffect > img').css('display', 'block');
	mouse.volume = 0.4;
	mouse.play();
}, function(){
	$('.class5 > .classbutton > .classnameback').css('left', '400px');
	$('.class5 > .classimgsffect > img').css('display', 'none');
});

$(".class6").hover(function(){
	var mouse = document.getElementById("mouse");
	$('.class6 > .classbutton > .classnameback').css('left', '33px');
	$('.class6 > .classimgsffect > img').css('display', 'block');
	mouse.volume = 0.4;
	mouse.play();
}, function(){
	$('.class6 > .classbutton > .classnameback').css('left', '400px');
	$('.class6 > .classimgsffect > img').css('display', 'none');
});


$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 27) {
			$('.talkwithbot').fadeOut();
			$('.craftermenu').fadeOut();
			$('.blockrigth').fadeOut();
			$('.confirmclass').fadeOut();
			$(".weaponinfo").hide();
			hasCreatedButtons = false
			hasCreatedButtons2 = false
			$.post('https://rsk-crafting/action', JSON.stringify({
				action: "close",
			}));
		}
	};
});
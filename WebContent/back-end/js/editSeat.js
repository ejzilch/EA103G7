$(document).ready(function() {
	var grid_size = 2;
	$(".draggable ,.ui-droppable-active ,.ui-droppable-hover ,.ui-droppable ").draggable({
		stop: function() {
			$(this).draggable("option", "revert", "invalid");
		},
		// 拖移時每次移動X px, Y px
		grid: [grid_size, grid_size],
		// 當前元素設置為可複製
		helper: "clone",
		// 當拖拽停止時，元素是否還原到它的開始位置
		revert: "invalid",
		revertDuration: 150,
		appendTo: "#container",
		// 鼠標總在拖移目標的
		cursorAt: { top: $(".draggable").height() / 2, left: $(".draggable").width() / 2 },
		// 滑鼠點下延遲100毫秒才拖移，避免不必要的拖移
		delay: 100,
		// 滑鼠點下移動多少才開始拖移，避免不必要的拖移
		distance: 10,
		// 設為障礙物
		obstacle: ".drag, .obj_bar, .draggable",
		preventCollision: true,
		// 設定範圍 
		// "document"：整個browser為範圍
		// "window"：拖曳開始起算當前視窗大小為範圍
		// "指定元素區塊" : 拖曳時若不再範圍內，拖曳物件會飛走
		containment: "document",
	});

	//            $(".draggable").droppable({
	//                greedy: true,
	//                tolerance: "touch",
	//                drop: function(event, ui) {
	//
	//                }
	//            });
	//            $(".drag").droppable({
	//                accept: ".draggable",
	//                tolerance: "touch",
	//                over: function(event, ui) {
	//                    $(ui.draggable).offset(ui.position);
	//                },
	//            });
	$("#container").droppable({
		// 區域內可接受drop的元素
		accept: ".draggable",

		// "fit"：完全重疊才落下
		// "intersect"：可拖拽在兩個方向上與可投放對象至少重疊50％。
		// "pointer"：鼠標指針與可放置對象重疊。
		// "touch"：可拖動對象與可放置對象重疊任意數量。
		tolerance: "fit",

		drop: function(event, ui) {
			// 將目前拖移物件做深層複製(clone(true)深層,clone(false)淺層),同時設置id&class屬性
			var newClone = $(ui.helper).clone(true).prop("id", "drag").prop("class", "drag");
			// 為編輯物件列表之拖移才複製
			if (ui.helper.is(".draggable")) {
				$(this).after(newClone);
			}
			// 設定checkbox為可點選
			$(".drag").find(".myCheckbox").prop("disabled", false);
			$(".drag").find(".seatName").prop("disabled", false);
			// 控制clone物件的拖曳
			$(".drag").draggable({
				// 開始拖移時,移除Class屬性
				start: function(event, ui) {
					$(ui.helper).removeClass("drag");
					$(ui.helper).addClass("drag1");
				},
				// 停止拖移時,增加Class屬性
				stop: function(event, ui) {
					$(ui.helper).removeClass("drag1");
					$(ui.helper).addClass("drag");
				},
				// 拖移時每次移動X px, Y px
				grid: [grid_size, grid_size],
				// 鼠標總在拖移目標的
				cursorAt: { top: $(".drag").height() / 2, left: $(".drag").width() / 2 },
				// 設為障礙物
				obstacle: ".drag, .obj_bar, .draggable",
				preventCollision: true,
				// 設定範圍
				containment: "#container",
				// 滑鼠點下移動多少才開始拖移，避免不必要的拖移
				distance: 10,
				// 對齊指定元素
				//				snap: ".drag",
				//				snapMode: "outer",
				snapTolerance: 20,
			});
			// 控制剛複製物件的checkbox
			$(".myCheckbox").click(function() {
				if ($(this).is(":checked"))
					$(this).show();
				else
					$(this).hide();
			});
		},
	});
	// 控制資料庫拉出物件的checkbox
	$(".myCheckbox").click(function() {
		if ($(this).is(":checked"))
			$(this).show();
		else
			$(this).hide();
	});

	$(".drag").draggable({
		// 開始拖移時,移除Class屬性
		start: function(event, ui) {
			$(ui.helper).removeClass("drag");
			$(ui.helper).addClass("drag1");
		},
		// 停止拖移時,增加Class屬性
		stop: function(event, ui) {
			$(ui.helper).removeClass("drag1");
			$(ui.helper).addClass("drag");
		},
		// 拖移時每次移動X px, Y px
		grid: [grid_size, grid_size],
		// 鼠標總在拖移目標的
		cursorAt: { top: $(".drag").height() / 2, left: $(".drag").width() / 2 },
		// 設為障礙物
		obstacle: ".drag, .obj_bar, .draggable",
		preventCollision: true,
		// 設定範圍
		containment: "#container",
		// 滑鼠點下移動多少才開始拖移，避免不必要的拖移
		distance: 10,
		// 對齊指定元素
		//				snap: ".drag",
		//				snapMode: "outer",
		snapTolerance: 20,
	});
	/***************** 獲得座位物件資訊，使用ajax傳送給servlet *****************/
	// sweet alert messages
	var errorText;
	var ajaxURL = (window.location.pathname).substr(0, (window.location.pathname).indexOf("/", (window.location.pathname).indexOf("/") + 1));
	// save seat
	$("#save").click(function() {
		// 獲取物件資訊
		var $drag = $(".drag");
		// substr error messages
		function ajaxSuccessFalse(xhr) {
			errorText = xhr.responseText.substr(xhr.responseText.indexOf("Message") + 12, xhr.responseText.indexOf("</p><p><b>Description") - (xhr.responseText.indexOf("Message") + 12));
		}
		// check seat area is not blank
		if ($drag.size() == 0) {
			swal("目前頁面無物件", "請編輯桌位列表，點擊按鈕或任何空白處離開");
			return;
		}
		// check .drag child .seatName input is not null
		$(".drag").each(function() {
			if ($(this).find(".seatName").val() == "") {
				swal("有桌位名稱為空值", "請檢查一遍桌位名稱是否有空值，點擊按鈕或任何空白處離開");
				textEmpty = false;
				return;
			}
		});
		// get all seat information
		var jsonDataStr = new Array();
		$.each($drag, function(_index, item) {
			var mySeat = new Object();
			mySeat.seat_no = $(this).find("input").attr("value");
			mySeat.seat_obj_no = $(item).find("img").attr("src").substr($(item).find("img").attr("src").lastIndexOf("=") + 1);
			mySeat.seat_name = $(item).find(".seatName").val().trim();
			mySeat.seat_x = Math.round($(item).position().left);
			mySeat.seat_y = Math.round($(item).position().top);
			mySeat.seat_l = $(item).height();
			mySeat.seat_w = $(item).width();
			mySeat.seat_f = parseInt($("#floor_list").val());
			// push data to JSONArray
			jsonDataStr.push(mySeat);
		});
		// use ajax transmision JSONArray for servlet
		$.ajax({
			// url is servlet url, ?archive_seat is tell servlet execute which one judgment 
			url: ajaxURL + "/seat/SeatServlet.do?action=archive_seat",
			type: "post",
			// synchronize is false
			async: false,
			data: {
				"jsonDataStr": JSON.stringify(jsonDataStr),
				"floor_list": $("#floor_list").val()
			},
			success: function(messages) {
				// 				console.log(messages);
				swal("儲存成功", "以儲存更動，點擊按鈕或任何空白處離開", "success").then(function() {
					$("body").load(ajaxURL + "/back-end/seat/editSeat.jsp");
					$.getScript(ajaxURL + "/back-end/js/jquery-1.12.4.js");
					$.getScript(ajaxURL + "/back-end/js/editSeat.js");
				});
			},
			error: function(xhr, ajaxOptions, thrownError) {
				ajaxSuccessFalse(xhr);
				swal("儲存失敗", errorText, "warning");
			},
		});
	});
	// delete seat
	$("#delete").click(function() {
		// check checkbox is checked?
		$("input:checked").each(function() {
			var mySeat = new Object();
			// get seat_no transmision for servlet delete seat
			mySeat.seat_no = $(this).attr("value");
			// check seat_no is not sull
			if (mySeat.seat_no != null) {
				var jsonDataStr = JSON.stringify(mySeat);
				$.ajax({
					// url is servlet url, ?action=delete_seat is tell servlet execute which one judgment 
					url: ajaxURL + "/seat/SeatServlet.do?action=delete_seat",
					type: "post",
					// async is false
					async: false,
					data: {
						"jsonDataStr": jsonDataStr
					},
					success: function(result) {
						swal("儲存成功", "成功刪除選取桌位", "success").then(function() {
							// 							$(".container").load("editSeat.jsp .container");
							// 							$.getScript("jquery-1.12.4.js");
							$("body").load(ajaxURL + "/back-end/seat/editSeat.jsp");
							$.getScript(ajaxURL + "/back-end/js/jquery-1.12.4.js");
						});
					},
					error: function() {
						alert("異常！");
					},
				});
				// this page if checked this div remove
				$("input:checked").each(function() {
					$("input:checked").closest("div").remove();
				});
			} else {
				$("input:checked").each(function() {
					$("input:checked").closest("div").remove();
				});
			}
		});
	});
	//	$("img").click(function() {
	//		$(this).toggleClass("rotate-img");
	//	});
});
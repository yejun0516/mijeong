extends Node2D

@onready var title_label = $CanvasLayer/Control/Panel/TitleLabel
@onready var message_label = $CanvasLayer/Control/Panel/MessageLabel
@onready var button = $CanvasLayer/Control/ekdma
@onready var panel = $CanvasLayer/Control/Panel
@onready var mijeong = $CanvasLayer/Mijeong_png
var quotes = [
	"오늘도 수고했어.",
	"천천히 가도 괜찮아.",
	"오늘은 너 자신을 믿어봐.",
	"작은 한 걸음도 전진이야.",
	"오늘도 미정이는 네 편이야.",
	"지금도 충분히 잘하고 있어.",
	"오늘은 웃을 일이 생길 거야.",
	"오늘은 스스로를 칭찬해줘.",
	"쉬어가는 것도 전진이야.",
	"조급해하지 않아도 괜찮아."
]

var foods = [
	"🍗 치킨",
	"🍕 피자",
	"🍜 라면",
	"🍣 초밥",
	"🍔 햄버거",
	"🥩 삼겹살",
	"🍛 카레",
	"🍝 파스타",
	"🥟 만두",
	"🍙 김밥"
]

var jokes = [
	"😂 소가 계단을 오르면? 소오름.",
	"😂 바나나가 웃으면? 바나나킥.",
	"😂 세상에서 가장 큰 콩은? 홍콩.",
	"😂 자동차가 웃으면? 카하하.",
	"😂 오리가 얼면? 언덕."
]

var lucks = [
	"🍀 오늘의 행운 숫자 : 7",
	"🍀 오늘의 행운 숫자 : 21",
	"🍀 오늘의 행운 색 : 초록",
	"🍀 오늘의 행운 색 : 파랑",
	"🍀 오늘은 좋은 일이 생길지도!"
]

var missions = [
	"🎯 물 한 잔 마시기",
	"🎯 10분 산책하기",
	"🎯 스트레칭 5분 하기",
	"🎯 부모님께 안부 연락하기",
	"🎯 오늘 나를 칭찬하기"
]

var card_colors = [
	Color8(45,45,45),
	Color8(53,74,53),
	Color8(47,63,95),
	Color8(79,59,99),
	Color8(95,70,48),
	Color8(53,82,82)
]

func _ready():
	title_label.text = "🦦 미정의 한마디"
	message_label.text = "🍎 밥을 주면\n미정이가 오늘의 결과를 알려줄게!"
	button.text = "🍎 밥 주기"
	button.disabled = false

	update_panel_color(card_colors[0])


func _on_button_pressed():

	var quote = quotes.pick_random()
	var food = foods.pick_random()
	var joke = jokes.pick_random()
	var luck = lucks.pick_random()
	var mission = missions.pick_random()

	message_label.text = (
		"🌿 오늘의 한마디\n"
		+ quote
		+ "\n\n🍗 오늘의 메뉴\n"
		+ food
		+ "\n\n😂 오늘의 아재개그\n"
		+ joke
		+ "\n\n🍀 오늘의 행운\n"
		+ luck
		+ "\n\n🎯 오늘의 미션\n"
		+ mission
	)

	button.disabled = true
	button.text = "🍎 오늘은 이미 밥을 먹었어!"

	update_panel_color(card_colors.pick_random())


func update_panel_color(color: Color):

	var style := StyleBoxFlat.new()

	style.bg_color = Color(color.r, color.g, color.b, 0.72)

	style.corner_radius_top_left = 24
	style.corner_radius_top_right = 24
	style.corner_radius_bottom_left = 24
	style.corner_radius_bottom_right = 24

	style.border_width_left = 1
	style.border_width_top = 1
	style.border_width_right = 1
	style.border_width_bottom = 1

	style.border_color = Color(1, 1, 1, 0.18)

	style.shadow_size = 14
	style.shadow_color = Color(0, 0, 0, 0.25)

	panel.add_theme_stylebox_override("panel", style)

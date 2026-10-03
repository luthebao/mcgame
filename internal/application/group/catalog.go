// Open-sourced by BaoLT

package group

type RecruitWill struct {
	ID       int
	Type     int
	Name     string
	MinLevel int
}

var recruitCatalog = []RecruitWill{
	{ID: 1, Type: 1, Name: "Mê Huyễn Thụ Động(Dễ)", MinLevel: 50},
	{ID: 2, Type: 1, Name: "Đại Mạc Bảo Khố(Dễ)", MinLevel: 60},
	{ID: 3, Type: 1, Name: "Lục Dã Bí Cảnh(Dễ)", MinLevel: 80},
	{ID: 4, Type: 1, Name: "Liệt Diễm Thâm Uyên(Dễ)", MinLevel: 90},
	{ID: 5, Type: 1, Name: "Liệt Diễm Thâm Uyên(Thường)", MinLevel: 90},
	{ID: 6, Type: 1, Name: "Liệt Diễm Thâm Uyên(Khó)", MinLevel: 90},
	{ID: 7, Type: 1, Name: "Trùng Phản Lang Huyệt(Dễ)", MinLevel: 100},
	{ID: 8, Type: 1, Name: "Trùng Phản Lang Huyệt(Thường)", MinLevel: 100},
	{ID: 9, Type: 1, Name: "Trùng Phản Lang Huyệt(Khó)", MinLevel: 100},
	{ID: 10, Type: 1, Name: "Hấp Huyết Quỷ Lạc Viên(Dễ)", MinLevel: 120},
	{ID: 11, Type: 1, Name: "Hấp Huyết Quỷ Lạc Viên(Thường)", MinLevel: 120},
	{ID: 12, Type: 1, Name: "Hấp Huyết Quỷ Lạc Viên(Khó)", MinLevel: 120},
	{ID: 13, Type: 2, Name: "Vô Ưu Bảo Vệ Chiến", MinLevel: 30},
	{ID: 14, Type: 2, Name: "Ác Linh Hiện Thế", MinLevel: 50},
	{ID: 15, Type: 3, Name: "Huyền Thưởng Nhiệm Vụ", MinLevel: 10},
	{ID: 16, Type: 3, Name: "Trừ Ma Nhiệm Vụ", MinLevel: 50},
	{ID: 17, Type: 3, Name: "Thần Tu Nhiệm Vụ", MinLevel: 50},
}

var recruitCatalogByID = func() map[int]RecruitWill {
	items := make(map[int]RecruitWill, len(recruitCatalog))
	for _, item := range recruitCatalog {
		items[item.ID] = item
	}
	return items
}()

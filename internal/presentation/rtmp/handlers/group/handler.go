// Open-sourced by BaoLT

package group

import (
	appchar "mcgame-server/internal/application/character"
	appgroup "mcgame-server/internal/application/group"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appscene "mcgame-server/internal/application/scene"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	logger         *zap.Logger
	groupService   *appgroup.Service
	charService    *appchar.Service
	itemService    *appitem.Service
	sceneService   *appscene.Service
	sceneManager   *rtmp.SceneManager
	petService     *apppet.Service
	rtmpServer     *rtmp.Server
	sendCallbackFn func(conn *rtmp.Connection, method string, args ...interface{}) error
	lookupConnFn   func(characterID string) *rtmp.Connection
}

func NewHandler(logger *zap.Logger, groupService *appgroup.Service) *Handler {
	handler := &Handler{logger: logger, groupService: groupService}
	handler.sendCallbackFn = func(conn *rtmp.Connection, method string, args ...interface{}) error {
		return conn.SendCallback(method, args...)
	}
	return handler
}

func (h *Handler) SetCharService(charService *appchar.Service) {
	h.charService = charService
}

func (h *Handler) SetItemService(itemService *appitem.Service) {
	h.itemService = itemService
}

func (h *Handler) SetSceneService(sceneService *appscene.Service) {
	h.sceneService = sceneService
}

func (h *Handler) SetSceneManager(sceneManager *rtmp.SceneManager) {
	h.sceneManager = sceneManager
}

func (h *Handler) SetPetService(petService *apppet.Service) {
	h.petService = petService
}

func (h *Handler) SetRTMPServer(rtmpServer *rtmp.Server) {
	h.rtmpServer = rtmpServer
	h.lookupConnFn = func(characterID string) *rtmp.Connection {
		return rtmpServer.GetConnectionByCharacterID(characterID)
	}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("groupInvite", h.GroupInvite)
	dispatcher.Register("groupJoin", h.GroupJoin)
	dispatcher.Register("groupReqDeny", h.GroupReqDeny)
	dispatcher.Register("groupAdd", h.GroupAdd)
	dispatcher.Register("groupRequest", h.GroupRequest)
	dispatcher.Register("groupLeave", h.GroupLeave)
	dispatcher.Register("groupKick", h.GroupKick)
	dispatcher.Register("groupGiveLeader", h.GroupGiveLeader)
	dispatcher.Register("groupAFK", h.GroupAFK)
	dispatcher.Register("unGroupAFK", h.UnGroupAFK)
	dispatcher.Register("groupListOfMap", h.GroupListOfMap)
	dispatcher.Register("reqAddGroup", h.ReqAddGroup)
	dispatcher.Register("groupReqSuccNotice", h.GroupReqSuccNotice)
	dispatcher.Register("getGroupMemberPosistion", h.GetGroupMemberPosition)
	dispatcher.Register("getCharLeaderClient", h.GetCharLeaderClient)
	dispatcher.Register("getRoomList", h.GetRoomList)
	dispatcher.Register("applyToRoom", h.ApplyToRoom)
	dispatcher.Register("getMyRoom", h.GetMyRoom)
	dispatcher.Register("createRoom", h.CreateRoom)
	dispatcher.Register("acceptRoomApply", h.AcceptRoomApply)
	dispatcher.Register("kickRoomMember", h.KickRoomMember)
	dispatcher.Register("leaveRoom", h.LeaveRoom)
	dispatcher.Register("setRoomHost", h.SetRoomHost)
	dispatcher.Register("setRoomConfig", h.SetRoomConfig)
	dispatcher.Register("roomChat", h.RoomChat)
}

// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.DynamicItemContainer

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.ui.view.comp.SimpleConainer;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.object.Charactor;
    import flash.display.DisplayObject;
    import com.qeedoo.game.object.Pet;

    public class DynamicItemContainer extends SimpleConainer 
    {


        public function addC(_arg_1:Charactor):DisplayObject
        {
            var _local_2:CharactorView;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:*;
            var _local_6:Number;
            if (_arg_1.id == Core.getInstance().cid)
            {
                _local_2 = new PlayerView();
                addChild(_local_2);
            }
            else
            {
                _local_2 = new CharactorView();
                _local_2.container = this;
            };
            _local_3 = _arg_1.decoInfo;
            if (_local_3)
            {
                for (_local_4 in _local_3)
                {
                    switch (Number(_local_3[_local_4]["position"]))
                    {
                        case 1:
                            _local_5 = GameData.d[GamePredef.TBL_DECO_SHOW][_local_3[_local_4]["did"]];
                            _local_6 = Number(_local_3[_local_4]["showLvl"]);
                            _arg_1.decoHeadCode = ((_local_5) ? Number(_local_5[("resCode" + ((2 * _local_6) - 1))]) : 0);
                            break;
                        case 2:
                            _local_5 = GameData.d[GamePredef.TBL_DECO_SHOW][_local_3[_local_4]["did"]];
                            _local_6 = Number(_local_3[_local_4]["showLvl"]);
                            _arg_1.decoLightCode = ((_local_5) ? Number(_local_5[("resCode" + ((2 * _local_6) - 1))]) : 0);
                            _arg_1.decoLightMaskCode = ((_local_5) ? Number(_local_5[("resCode" + (2 * _local_6))]) : 0);
                            break;
                        case 3:
                            _local_5 = GameData.d[GamePredef.TBL_DECO_SHOW][_local_3[_local_4]["did"]];
                            _local_6 = Number(_local_3[_local_4]["showLvl"]);
                            _arg_1.decoFootCode = ((_local_5) ? Number(_local_5[("resCode" + ((2 * _local_6) - 1))]) : 0);
                            break;
                        case 4:
                            _local_5 = GameData.d[GamePredef.TBL_DECO_SHOW][_local_3[_local_4]["did"]];
                            _local_6 = Number(_local_3[_local_4]["showLvl"]);
                            _arg_1.decoBottomCode = ((_local_5) ? Number(_local_5[("resCode" + ((2 * _local_6) - 1))]) : 0);
                            _arg_1.decoBottomCodeOnMount = ((_local_5) ? Number(_local_5[("resCode" + (2 * _local_6))]) : 0);
                            break;
                    };
                };
            };
            _local_2.gameObject = _arg_1;
            if (((isNaN(_arg_1.dressResCode)) || (_arg_1.dressResCode <= 0)))
            {
                _local_2.colorCode = _arg_1.colorCode;
            }
            else
            {
                if (((_local_2.isDefaultRes()) || (_local_2.isRebirthRes())))
                {
                    _local_2.colorCode = 0;
                    _local_2.setRes(_arg_1.dressResCode);
                }
                else
                {
                    _local_2.setRes(_arg_1.resCode);
                };
            };
            _arg_1.normalView = _local_2;
            _local_2.setLeagueFlag(_arg_1["leagueIcon"]);
            return (_local_2);
        }

        public function sortNeighbour(_arg_1:int):void
        {
            var _local_2:Array;
            var _local_3:Array;
            if (numChildren < 2)
            {
                return;
            };
            if (_arg_1 == 0)
            {
                _local_2 = [getChildAt(0), getChildAt(1)];
                _local_3 = _local_2.sortOn("yBase", Array.NUMERIC);
                setChildIndex(_local_3[0], 0);
                setChildIndex(_local_3[1], 1);
                return;
            };
            if (_arg_1 == (numChildren - 1))
            {
                _local_2 = [getChildAt((_arg_1 - 1)), getChildAt(_arg_1)];
                _local_3 = _local_2.sortOn("yBase", Array.NUMERIC);
                setChildIndex(_local_3[0], (_arg_1 - 1));
                setChildIndex(_local_3[1], _arg_1);
            }
            else
            {
                _local_2 = [getChildAt((_arg_1 - 1)), getChildAt(_arg_1), getChildAt((_arg_1 + 1))];
                _local_3 = _local_2.sortOn("yBase", Array.NUMERIC);
                setChildIndex(_local_3[0], (_arg_1 - 1));
                setChildIndex(_local_3[1], _arg_1);
                setChildIndex(_local_3[2], (_arg_1 + 1));
            };
        }

        private function setPetPos(_arg_1:Pet):Pet
        {
            var _local_3:Charactor;
            var _local_4:int;
            var _local_2:Core = Core.getInstance();
            if (_arg_1.leaderId > 0)
            {
                _local_3 = _local_2.getCharactor(_arg_1.leaderId);
                if (_local_3)
                {
                    _arg_1.posX = _local_3.posX;
                    _arg_1.posY = _local_3.posY;
                };
            }
            else
            {
                _local_4 = _local_2.getCharactor(_arg_1.cid).dir;
                if (_local_4 == 0)
                {
                    _arg_1.posX = _local_2.getCharactor(_arg_1.cid).posX;
                    _arg_1.posY = ((_local_2.getCharactor(_arg_1.cid).posY - GamePredef.GROUP_PET_FOLLOW_DISTANCE) + 1);
                }
                else
                {
                    if (_local_4 == 1)
                    {
                        _arg_1.posX = (_local_2.getCharactor(_arg_1.cid).posX - (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                        _arg_1.posY = (_local_2.getCharactor(_arg_1.cid).posY - (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                    }
                    else
                    {
                        if (_local_4 == 2)
                        {
                            _arg_1.posX = ((_local_2.getCharactor(_arg_1.cid).posX - GamePredef.GROUP_PET_FOLLOW_DISTANCE) + 1);
                            _arg_1.posY = _local_2.getCharactor(_arg_1.cid).posY;
                        }
                        else
                        {
                            if (_local_4 == 3)
                            {
                                _arg_1.posX = (_local_2.getCharactor(_arg_1.cid).posX - (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                                _arg_1.posY = (_local_2.getCharactor(_arg_1.cid).posY + (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                            }
                            else
                            {
                                if (_local_4 == 4)
                                {
                                    _arg_1.posX = _local_2.getCharactor(_arg_1.cid).posX;
                                    _arg_1.posY = ((_local_2.getCharactor(_arg_1.cid).posY + GamePredef.GROUP_PET_FOLLOW_DISTANCE) + 1);
                                }
                                else
                                {
                                    if (_local_4 == 5)
                                    {
                                        _arg_1.posX = (_local_2.getCharactor(_arg_1.cid).posX + (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                                        _arg_1.posY = (_local_2.getCharactor(_arg_1.cid).posY + (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                                    }
                                    else
                                    {
                                        if (_local_4 == 6)
                                        {
                                            _arg_1.posX = ((_local_2.getCharactor(_arg_1.cid).posX + GamePredef.GROUP_PET_FOLLOW_DISTANCE) + 1);
                                            _arg_1.posY = _local_2.getCharactor(_arg_1.cid).posY;
                                        }
                                        else
                                        {
                                            if (_local_4 == 7)
                                            {
                                                _arg_1.posX = (_local_2.getCharactor(_arg_1.cid).posX + (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                                                _arg_1.posY = (_local_2.getCharactor(_arg_1.cid).posY - (GamePredef.GROUP_PET_FOLLOW_DISTANCE / 1.4));
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            return (_arg_1);
        }

        public function sortChildren():void
        {
            var _local_3:*;
            var _local_1:Array = getChildren();
            var _local_2:Array = _local_1.sortOn("yBase", Array.NUMERIC);
            for (_local_3 in _local_2)
            {
                setChildIndex(_local_2[_local_3], _local_3);
            };
        }

        public function addP(_arg_1:Pet):DisplayObject
        {
            var _local_2:Core = Core.getInstance();
            setPetPos(_arg_1);
            var _local_3:PetView = new PetView();
            _local_3.gameObject = _arg_1;
            var _local_4:CharactorView = CharactorView(_local_2.view.getC(_arg_1.cid));
            _local_3.faceToTarget(_local_4);
            _local_3.startFollow(_local_4);
            addChild(_local_3);
            _local_3.container = this;
            _arg_1.normalView = _local_3;
            return (_local_3);
        }


    }
}//package com.qeedoo.ui.view.compGameStage


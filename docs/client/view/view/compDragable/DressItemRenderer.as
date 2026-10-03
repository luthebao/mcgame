// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DressItemRenderer

package com.qeedoo.ui.view.compDragable
{
    import mx.controls.treeClasses.TreeItemRenderer;
    import flash.text.TextField;
    import com.qeedoo.game.system.Core;
    import flash.text.TextFormat;
    import flash.text.AntiAliasType;
    import com.qeedoo.game.predef.GamePredef;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.data.GameData;
    import mx.core.IUITextField;

    public class DressItemRenderer extends TreeItemRenderer 
    {

        private var _statText:TextField;
        private var _core:Core = Core.getInstance();

        public function DressItemRenderer()
        {
            var _local_1:TextFormat = new TextFormat();
            _local_1.font = "宋体";
            _local_1.size = 12;
            _local_1.color = 0xFF00;
            _statText = new TextField();
            _statText.selectable = false;
            _statText.mouseEnabled = false;
            _statText.mouseWheelEnabled = false;
            _statText.defaultTextFormat = _local_1;
            _statText.y = 2;
            _statText.x = 130;
            _statText.antiAliasType = AntiAliasType.ADVANCED;
            _statText.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
            this.addChild(_statText);
        }

        private function checkRecipeByDressId(_arg_1:Number):Boolean
        {
            if (!_core.player.dressInfo)
            {
                return (false);
            };
            var _local_2:Object = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
            if ((((!(_local_2)) || (!(_local_2.recipe))) || (!(_local_2.bag))))
            {
                return (false);
            };
            if (((_local_2.book) && (_local_2.book[_arg_1])))
            {
                return (false);
            };
            var _local_3:Object = _local_2.bag;
            var _local_4:Object = _local_2.recipe;
            var _local_5:Object = GameData.d[GamePredef.TBL_DRESS][_arg_1];
            if (!_local_5)
            {
                return (false);
            };
            var _local_6:Number = Number(_local_4[_local_5.recipeId]);
            if (((isNaN(_local_6)) || (_local_6 <= 0)))
            {
                return (false);
            };
            return (true);
        }

        override protected function commitProperties():void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Number;
            var _local_8:Object;
            var _local_9:Object;
            super.commitProperties();
            var _local_1:Boolean;
            var _local_2:Boolean;
            if (!data)
            {
                label.htmlText = "";
                _local_1 = false;
            }
            else
            {
                if (!data.hasOwnProperty("id"))
                {
                    _local_3 = data.color;
                    if (((!(_local_3)) || (_local_3 < 0)))
                    {
                        _local_3 = 0;
                    };
                    _local_4 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_3]) + "'>") + data.name) + "</font>");
                    label.htmlText = _local_4;
                    for each (_local_5 in data.children)
                    {
                        if (checkStackByDressId(_local_5.id))
                        {
                            _local_1 = true;
                            break;
                        };
                        if (checkRecipeByDressId(_local_5.id))
                        {
                            _local_2 = true;
                            break;
                        };
                    };
                }
                else
                {
                    _local_6 = "#999999";
                    _local_7 = data.id;
                    if (Core.getInstance().player.dressInfo)
                    {
                        _local_8 = com.adobe.serialization.json.JSON.decode(Core.getInstance().player.dressInfo);
                        if (((_local_8) && (_local_8.book)))
                        {
                            _local_9 = _local_8.book;
                            if (_local_9[_local_7])
                            {
                                _local_3 = data.color;
                                if (((!(_local_3)) || (_local_3 < 0)))
                                {
                                    _local_3 = 0;
                                };
                                _local_6 = GamePredef.MSG_ITEM_COLOR[_local_3];
                            };
                        };
                    };
                    _local_4 = (((("<font color='" + _local_6) + "'>") + data.name) + "</font>");
                    label.htmlText = _local_4;
                    _local_1 = checkStackByDressId(data.id);
                    _local_2 = checkRecipeByDressId(data.id);
                };
            };
            _statText.text = "";
            if (_local_2)
            {
                _statText.text = "(Có bộ)";
            };
            if (_local_1)
            {
                _statText.text = "(K.Hoạt)";
            };
        }

        private function checkStackByDressId(_arg_1:Number):Boolean
        {
            if (!_core.player.dressInfo)
            {
                return (false);
            };
            var _local_2:Object = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
            if ((((!(_local_2)) || (!(_local_2.recipe))) || (!(_local_2.bag))))
            {
                return (false);
            };
            if (((_local_2.book) && (_local_2.book[_arg_1])))
            {
                return (false);
            };
            var _local_3:Object = _local_2.bag;
            var _local_4:Object = _local_2.recipe;
            var _local_5:Number = ((_local_3.crystal) ? Number(_local_3.crystal) : 0);
            var _local_6:Number = ((_local_3.jewel) ? Number(_local_3.jewel) : 0);
            var _local_7:Object = GameData.d[GamePredef.TBL_DRESS][_arg_1];
            if (!_local_7)
            {
                return (false);
            };
            var _local_8:Number = Number(_local_4[_local_7.recipeId]);
            if (((isNaN(_local_8)) || (_local_8 <= 0)))
            {
                return (false);
            };
            if (((_local_5 < Number(_local_7.num1)) || (_local_6 < Number(_local_7.num2))))
            {
                return (false);
            };
            return (true);
        }

        override protected function createInFontContext(_arg_1:Class):Object
        {
            var _local_2:Object = super.createInFontContext(_arg_1);
            var _local_3:IUITextField = IUITextField(_local_2);
            _local_3.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
            return (_local_3);
        }


    }
}//package com.qeedoo.ui.view.compDragable


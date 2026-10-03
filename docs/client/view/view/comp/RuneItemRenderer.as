// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RuneItemRenderer

package com.qeedoo.ui.view.comp
{
    import mx.controls.treeClasses.TreeItemRenderer;
    import mx.controls.Label;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;

    public class RuneItemRenderer extends TreeItemRenderer 
    {

        private var _labelNum:Label;
        private var _core:Core = Core.getInstance();

        public function RuneItemRenderer()
        {
            _labelNum = new Label();
            _labelNum.setStyle("color", 0xFF00);
            _labelNum.setStyle("fontSize", 12);
            this.addChild(_labelNum);
        }

        override protected function commitProperties():void
        {
            var _local_1:int;
            var _local_2:String;
            var _local_3:Number;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Number;
            super.commitProperties();
            if (!data)
            {
                label.htmlText = "";
            }
            else
            {
                if (((!(data.hasOwnProperty("id"))) && (data.hasOwnProperty("kind"))))
                {
                    _local_1 = data["kind"];
                    _local_2 = Language.DECORATE_PANEL[21][(_local_1 - 1)];
                    _local_3 = data["kindNum"];
                    if (_local_3)
                    {
                        label.htmlText = ((((_local_2 + "<font color='#00FF00'>") + "    (") + _local_3) + ")</font>");
                    }
                    else
                    {
                        label.htmlText = _local_2;
                    };
                }
                else
                {
                    if (((!(data.hasOwnProperty("id"))) && (data.hasOwnProperty("quality"))))
                    {
                        _local_4 = data["quality"];
                        _local_2 = Language.DECORATE_PANEL[60][(_local_4 - 1)];
                        _local_5 = data["qualityNum"];
                        if (_local_5)
                        {
                            label.htmlText = ((((((("<font color='" + GamePredef.MSG_ITEM_COLOR[(_local_4 - 1)]) + "'>") + _local_2) + "<font color='#00FF00'>") + "    (") + _local_5) + ")</font>");
                        }
                        else
                        {
                            label.htmlText = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[(_local_4 - 1)]) + "'>") + _local_2) + "</font>");
                        };
                    }
                    else
                    {
                        if (data.hasOwnProperty("id"))
                        {
                            _local_4 = data["qulity"];
                            _local_6 = data["itemNum"];
                            if (_local_6)
                            {
                                label.htmlText = ((((((("<font color='" + GamePredef.MSG_ITEM_COLOR[(_local_4 - 1)]) + "'>") + data.name) + "<font color='#00FF00'>") + "    (") + _local_6) + ")</font>");
                            }
                            else
                            {
                                label.htmlText = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[(_local_4 - 1)]) + "'>") + data.name) + "</font>");
                            };
                        };
                    };
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp


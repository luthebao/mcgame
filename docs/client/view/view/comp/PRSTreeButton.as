// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PRSTreeButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Image;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;

    public class PRSTreeButton extends Image 
    {

        private var _core:Core = Core.getInstance();
        private var _treeId:Number = 0;
        public var actived:Boolean = false;


        override public function initialize():void
        {
            super.initialize();
        }

        public function set treeId(_arg_1:Number):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:uint;
            _treeId = _arg_1;
            if (_treeId)
            {
                _local_2 = GameData.d[GamePredef.TBL_PRS_TREE][_treeId];
                _local_3 = "";
                _local_3 = (_local_3 + Language.PRS_PANEL[21]);
                if (actived)
                {
                    _local_3 = (_local_3 + ((("\n" + "<font color='#00FF00'>") + Language.PRS_PANEL[22]) + "</font>"));
                }
                else
                {
                    _local_3 = (_local_3 + ((("\n" + "<font color='#FF0000'>") + Language.PRS_PANEL[23]) + "</font>"));
                };
                _local_4 = 1;
                while (_local_4 <= 8)
                {
                    if (Number(_local_2[("pT" + _local_4)]))
                    {
                        if (((((Number(_local_2[("pT" + _local_4)]) == 59) || (Number(_local_2[("pT" + _local_4)]) == 60)) || (Number(_local_2[("pT" + _local_4)]) == 62)) || (Number(_local_2[("pT" + _local_4)]) == 63)))
                        {
                            _local_3 = (_local_3 + ((("\n" + Language.PRS_PROP_TIP[Number(_local_2[("pT" + _local_4)])]) + (Number(_local_2[("pN" + _local_4)]) / 100)) + "%"));
                        }
                        else
                        {
                            if (((((((Number(_local_2[("pT" + _local_4)]) == 1) || (Number(_local_2[("pT" + _local_4)]) == 4)) || (Number(_local_2[("pT" + _local_4)]) == 5)) || (Number(_local_2[("pT" + _local_4)]) == 6)) || (Number(_local_2[("pT" + _local_4)]) == 7)) || (Number(_local_2[("pT" + _local_4)]) == 11)))
                            {
                                _local_3 = (_local_3 + (("\n" + Language.PRS_PROP_TIP[Number(_local_2[("pT" + _local_4)])]) + Number(_local_2[("pN" + _local_4)])));
                            }
                            else
                            {
                                _local_3 = (_local_3 + (("\n" + Language.PRS_PROP_TIP[Number(_local_2[("pT" + _local_4)])]) + (Number(_local_2[("pN" + _local_4)]) / 100)));
                            };
                        };
                    };
                    _local_4++;
                };
                this.toolTip = _local_3;
            };
        }


    }
}//package com.qeedoo.ui.view.comp


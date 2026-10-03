// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.BigContractCircle

package com.qeedoo.ui.view.compDragable
{
    import mx.core.UIComponent;
    import flash.text.TextField;
    import com.qeedoo.game.system.Core;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import com.qeedoo.game.predef.GamePredef;
    import flash.display.MovieClip;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.resource.ResCacher;
    import flash.display.LoaderInfo;
    import flash.events.Event;

    public class BigContractCircle extends UIComponent 
    {

        private static const RADIUS:int = 70;
        private static const SWF_BASE:Number = 2080130102009;

        private var _textField:TextField;

        private var _core:Core = Core.getInstance();
        private var _circleDict:Object = {};

        public function BigContractCircle()
        {
            this.width = (this.height = (2 * RADIUS));
            this.mouseEnabled = (this.mouseChildren = false);
            _textField = new TextField();
            _textField.y = 60;
            _textField.width = (2 * RADIUS);
            _textField.selectable = false;
            _textField.mouseEnabled = false;
            _textField.mouseWheelEnabled = false;
            var _local_1:TextFormat = new TextFormat("宋体", 14, 0xFFFFFF);
            _local_1.align = TextFormatAlign.CENTER;
            _textField.defaultTextFormat = _local_1;
            _textField.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
            this.addChild(_textField);
        }

        private function changeCircle(_arg_1:int, _arg_2:MovieClip):void
        {
            var _local_3:*;
            var _local_4:MovieClip;
            for (_local_3 in _circleDict)
            {
                _local_4 = _circleDict[_local_3];
                if (((_local_4) && (!(_local_4 == _arg_2))))
                {
                    _local_4.visible = false;
                };
            };
            _arg_2.visible = true;
            _circleDict[_arg_1] = _arg_2;
            if (_arg_2.parent != this)
            {
                _arg_2.x = (((2 * RADIUS) - _arg_2.width) >> 1);
                this.addChildAt(_arg_2, 0);
            };
        }

        public function updateView(selectType:int):void
        {
            var stepIndex:int;
            var circleUrl:String;
            var circleSwf:MovieClip;
            var needExp:Number;
            var expStr:String;
            var propExp:Number;
            var maxExp:Number;
            var onLoadSwf:Function;
            var contractPet:Object = _core.player.contractPet;
            var propStr:String = GamePredef.CONTRACT_DICT[selectType];
            var propLvl:int = (((contractPet) && (contractPet[propStr])) ? contractPet[propStr] : 0);
            var nextLvl:int = (propLvl + 1);
            var contractMeta:Object = GameData.d[GamePredef.TBL_PET_CONTRACT][nextLvl];
            if (contractMeta)
            {
                needExp = contractMeta.reqExp;
                expStr = (propStr + GamePredef.CONTRACT_EXP);
                propExp = (((contractPet) && (contractPet[expStr])) ? contractPet[expStr] : 0);
                stepIndex = int(int(((100 * propExp) / needExp)));
                _textField.htmlText = ((propExp + "/") + needExp);
            }
            else
            {
                stepIndex = 100;
                contractMeta = GameData.d[GamePredef.TBL_PET_CONTRACT][GamePredef.MAX_CONTRACT_LEVEL];
                maxExp = contractMeta.reqExp;
                _textField.htmlText = ((maxExp + "/") + maxExp);
            };
            circleUrl = ResManager.getResUrl((SWF_BASE + selectType));
            circleSwf = (ResCacher.getInstance().getRes(circleUrl) as MovieClip);
            if (!circleSwf)
            {
                onLoadSwf = function (_arg_1:Event):void
                {
                    var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
                    if (_local_2.url.indexOf(circleUrl) == -1)
                    {
                        return;
                    };
                    ResCacher.getInstance().removeEventListener("complete", onLoadSwf);
                    circleSwf = (_arg_1.target.current_complete_loader.content as MovieClip);
                    circleSwf.gotoAndStop(stepIndex);
                    changeCircle(selectType, circleSwf);
                };
                ResCacher.getInstance().addEventListener("complete", onLoadSwf);
                return;
            };
            circleSwf.gotoAndStop(stepIndex);
            this.changeCircle(selectType, circleSwf);
        }


    }
}//package com.qeedoo.ui.view.compDragable


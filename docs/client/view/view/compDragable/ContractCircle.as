// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ContractCircle

package com.qeedoo.ui.view.compDragable
{
    import mx.core.UIComponent;
    import flash.text.TextField;
    import com.qeedoo.game.system.Core;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.resource.ResCacher;
    import flash.display.LoaderInfo;

    public class ContractCircle extends UIComponent 
    {

        private static const RADIUS:int = 35;
        private static const SWF_BASE:Number = 2080130102013;

        private var _textField:TextField;
        public var type:int = 1;
        private var _core:Core = Core.getInstance();

        public function ContractCircle()
        {
            this.graphics.beginFill(0xFFFFFF, 0);
            this.graphics.drawCircle(RADIUS, RADIUS, RADIUS);
            this.graphics.endFill();
            this.buttonMode = true;
            _textField = new TextField();
            _textField.y = 20;
            _textField.width = (2 * RADIUS);
            _textField.selectable = false;
            _textField.mouseEnabled = false;
            _textField.mouseWheelEnabled = false;
            var _local_1:TextFormat = new TextFormat("宋体", 12, 0xFFFFFF);
            _local_1.align = TextFormatAlign.CENTER;
            _local_1.leading = 6;
            _textField.defaultTextFormat = _local_1;
            _textField.filters = [GamePredef.FILTER_GLOW_LOWBLACK];
            this.addChild(_textField);
            this.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
            this.addEventListener(MouseEvent.MOUSE_OUT, outHandler);
        }

        private function addCircleSwf(_arg_1:MovieClip):void
        {
            _arg_1.mouseEnabled = false;
            _arg_1.mouseChildren = false;
            if (_arg_1.parent == this)
            {
                return;
            };
            _arg_1.x = (((2 * RADIUS) - _arg_1.width) >> 1);
            this.addChildAt(_arg_1, 0);
        }

        private function overHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            this.filters = [GamePredef.FILTER_GLOW_GOLD_HIGH];
        }

        private function outHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            this.filters = null;
        }

        public function updateView():void
        {
            var stepIndex:int;
            var circleUrl:String;
            var circleSwf:MovieClip;
            var onLoadSwf:Function;
            var contractPet:Object = _core.player.contractPet;
            var propStr:String = GamePredef.CONTRACT_DICT[type];
            var propLvl:int = (((contractPet) && (contractPet[propStr])) ? contractPet[propStr] : 0);
            stepIndex = int(int(((100 * propLvl) / GamePredef.MAX_CONTRACT_LEVEL)));
            _textField.htmlText = ((Language.PET_EVOLUTION_PANEL_U[59][type] + Language.PET_EVOLUTION_PANEL_U[63]) + propLvl);
            circleUrl = ResManager.getResUrl((SWF_BASE + type));
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
                    addCircleSwf(circleSwf);
                };
                ResCacher.getInstance().addEventListener("complete", onLoadSwf);
                return;
            };
            circleSwf.gotoAndStop(stepIndex);
            this.addCircleSwf(circleSwf);
        }


    }
}//package com.qeedoo.ui.view.compDragable


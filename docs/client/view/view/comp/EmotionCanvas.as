// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.EmotionCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.event.GameEvent;
    import flash.events.Event;

    public class EmotionCanvas extends Canvas 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":190,
                    "height":130,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/no ",
                                "x":0,
                                "y":90,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/yes ",
                                "x":30,
                                "y":90,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/pig ",
                                "x":150,
                                "y":60,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/heart ",
                                "x":60,
                                "y":90,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/icy ",
                                "x":90,
                                "y":60,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/shit ",
                                "x":120,
                                "y":60,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button7_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/laugh ",
                                "x":30,
                                "y":0,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button8_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/depress ",
                                "x":0,
                                "y":30,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button9_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/daze ",
                                "x":150,
                                "y":30,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button10_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/face ",
                                "x":0,
                                "y":60,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button11_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/shy ",
                                "x":90,
                                "y":0,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button12_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/distress ",
                                "x":90,
                                "y":30,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button13_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/devil ",
                                "x":120,
                                "y":30,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button14_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/excite ",
                                "x":150,
                                "y":0,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button15_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/anger ",
                                "x":60,
                                "y":30,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button16_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/tear ",
                                "x":30,
                                "y":60,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button17_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/sigh ",
                                "x":60,
                                "y":0,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button18_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/smile ",
                                "x":0,
                                "y":0,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button19_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/shock ",
                                "x":60,
                                "y":60,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button20_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/cry ",
                                "x":30,
                                "y":30,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button21_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/mess ",
                                "x":120,
                                "y":0,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button22_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/bnhh ",
                                "x":90,
                                "y":90,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___EmotionCanvas_Button23_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "toolTip":"/xfmm ",
                                "x":120,
                                "y":90,
                                "styleName":"BtnEmotion",
                                "width":30,
                                "height":30
                            });
                        }
                    })]
                });
            }
        });

        public function EmotionCanvas()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 130;
            this.styleName = "CanvasEmotion";
            this.addEventListener("rollOut", ___EmotionCanvas_Canvas1_rollOut);
        }

        public function ___EmotionCanvas_Button4_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button5_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function hide():void
        {
            visible = false;
        }

        public function ___EmotionCanvas_Button7_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button8_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button9_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button11_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button12_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button13_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button6_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button15_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button16_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button10_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button18_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button19_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function ___EmotionCanvas_Button17_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button1_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button14_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        private function sendEm(_arg_1:Event):void
        {
            var _local_2:Button = Button(_arg_1.currentTarget);
            var _local_3:GameEvent = new GameEvent(GameEvent.PLAYER_SEND_EMOTION);
            _local_3.data = _local_2.toolTip;
            dispatchEvent(_local_3);
            hide();
        }

        public function ___EmotionCanvas_Canvas1_rollOut(_arg_1:MouseEvent):void
        {
            hide();
        }

        public function changeVisible():void
        {
            visible = (!(visible));
        }

        public function ___EmotionCanvas_Button20_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button21_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button22_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button23_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function show():void
        {
            visible = true;
        }

        public function ___EmotionCanvas_Button2_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }

        public function ___EmotionCanvas_Button3_click(_arg_1:MouseEvent):void
        {
            sendEm(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp


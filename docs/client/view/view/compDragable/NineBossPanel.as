// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NineBossPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.core.IUITextField;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class NineBossPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _68587798bossImg:Image;
        private var _2126222779bossInfo:IntroText;
        private var _1254502066gaBtn0:BasicGlowButton;
        private var _1254502062gaBtn4:BasicGlowButton;
        private var _1554141554tabBtn5:BasicGlowButton;
        private var _topFloor:int = 0;
        private var _1421659366afBtn1:BasicGlowButton;
        private var _1554141553tabBtn6:BasicGlowButton;
        private var _1421659363afBtn4:BasicGlowButton;
        private var _1254502063gaBtn3:BasicGlowButton;
        private var _1554141552tabBtn7:BasicGlowButton;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _alert:Alert;
        private var _1554141551tabBtn8:BasicGlowButton;
        private var _1254502057gaBtn9:BasicGlowButton;
        private var _1421659364afBtn3:BasicGlowButton;
        public var _NineBossPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1421659360afBtn7:BasicGlowButton;
        private var _1254502060gaBtn6:BasicGlowButton;
        private var _finishTopFloor:int = 0;
        private var _1254502064gaBtn2:BasicGlowButton;
        private var _1554141550tabBtn9:BasicGlowButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _firstflag:Boolean = true;
        private var _1421659358afBtn9:BasicGlowButton;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _98195ca1:Canvas;
        private var _1254502058gaBtn8:BasicGlowButton;
        private var _currentImgeRes:Number;
        private var _1421659361afBtn6:BasicGlowButton;
        private var _1421659365afBtn2:BasicGlowButton;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _1254502065gaBtn1:BasicGlowButton;
        private var _1254502061gaBtn5:BasicGlowButton;
        private var _234858303gaBtn10:BasicGlowButton;
        private var _1421659359afBtn8:BasicGlowButton;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var _1254502059gaBtn7:BasicGlowButton;
        private var _1421659362afBtn5:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":495,
                    "height":467,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_NineBossPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"ca1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":29,
                                "width":487,
                                "height":438,
                                "creationPolicy":"all",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":0,
                                            "width":335,
                                            "height":316,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"bossImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":317,
                                                        "height":298
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn1",
                                    "events":{"click":"__afBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":10,
                                            "height":23,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn1",
                                    "events":{"click":"__gaBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":12,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn2",
                                    "events":{"click":"__afBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":41,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn2",
                                    "events":{"click":"__gaBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":43,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn3",
                                    "events":{"click":"__afBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":72,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn3",
                                    "events":{"click":"__gaBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":74,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn4",
                                    "events":{"click":"__afBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":103,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn4",
                                    "events":{"click":"__gaBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":105,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn5",
                                    "events":{"click":"__afBtn5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":134,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn5",
                                    "events":{"click":"__gaBtn5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":136,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn6",
                                    "events":{"click":"__afBtn6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":165,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn6",
                                    "events":{"click":"__gaBtn6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":167,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn7",
                                    "events":{"click":"__afBtn7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":196,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn7",
                                    "events":{"click":"__gaBtn7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":198,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn8",
                                    "events":{"click":"__afBtn8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":227,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn8",
                                    "events":{"click":"__gaBtn8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":229,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"afBtn9",
                                    "events":{"click":"__afBtn9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":362,
                                            "y":258,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn9",
                                    "events":{"click":"__gaBtn9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":437,
                                            "y":260,
                                            "width":59,
                                            "height":20,
                                            "enabled":false,
                                            "styleName":"BtnStdRed",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn10",
                                    "events":{"click":"__gaBtn10_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":407,
                                            "y":286,
                                            "width":70,
                                            "height":21,
                                            "enabled":false,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":80,
                                            "height":24,
                                            "x":20,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":100,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":140,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":180,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":220,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn5",
                                    "events":{"click":"__tabBtn5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":260,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn6",
                                    "events":{"click":"__tabBtn6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":300,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn7",
                                    "events":{"click":"__tabBtn7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":340,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn8",
                                    "events":{"click":"__tabBtn8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":380,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn9",
                                    "events":{"click":"__tabBtn9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40,
                                            "height":24,
                                            "x":420,
                                            "y":315
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"bossInfo",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "y":338,
                                            "width":465,
                                            "height":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"gaBtn0",
                                    "events":{"click":"__gaBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":348,
                                            "y":286,
                                            "width":51,
                                            "height":21,
                                            "enabled":false,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _bossPrice:* = {
            "0":0,
            "1":30,
            "2":70,
            "3":115,
            "4":170,
            "5":245,
            "6":345,
            "7":480,
            "8":670,
            "9":920,
            "10":0
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function NineBossPanel()
        {
            mx_internal::_document = this;
            this.width = 495;
            this.height = 467;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___NineBossPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NineBossPanel._watcherSetupUtil = _arg_1;
        }


        public function __afBtn1_click(_arg_1:MouseEvent):void
        {
            attackFloor(1);
        }

        public function ___NineBossPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initNineBossPanel();
        }

        public function __afBtn5_click(_arg_1:MouseEvent):void
        {
            attackFloor(5);
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function __afBtn9_click(_arg_1:MouseEvent):void
        {
            attackFloor(9);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn4():BasicGlowButton
        {
            return (this._1421659363afBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn5():BasicGlowButton
        {
            return (this._1421659362afBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn6():BasicGlowButton
        {
            return (this._1421659361afBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn7():BasicGlowButton
        {
            return (this._1421659360afBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn2():BasicGlowButton
        {
            return (this._1421659365afBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn3():BasicGlowButton
        {
            return (this._1421659364afBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get bossImg():Image
        {
            return (this._68587798bossImg);
        }

        public function set ca1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._98195ca1;
            if (_local_2 !== _arg_1)
            {
                this._98195ca1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ca1", _local_2, _arg_1));
            };
        }

        public function set tabBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141552tabBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1554141552tabBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get afBtn1():BasicGlowButton
        {
            return (this._1421659366afBtn1);
        }

        public function set tabBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn8():BasicGlowButton
        {
            return (this._1421659359afBtn8);
        }

        [Bindable(event="propertyChange")]
        public function get afBtn9():BasicGlowButton
        {
            return (this._1421659358afBtn9);
        }

        public function set tabBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabClick(3);
        }

        public function set afBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659365afBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1421659365afBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn2", _local_2, _arg_1));
            };
        }

        public function __gaBtn0_click(_arg_1:MouseEvent):void
        {
            getAward(9);
        }

        public function set afBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659364afBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1421659364afBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn3", _local_2, _arg_1));
            };
        }

        public function __tabBtn7_click(_arg_1:MouseEvent):void
        {
            tabClick(7);
        }

        public function __gaBtn4_click(_arg_1:MouseEvent):void
        {
            getAward(4);
        }

        public function set afBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659362afBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1421659362afBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn5", _local_2, _arg_1));
            };
        }

        public function __gaBtn8_click(_arg_1:MouseEvent):void
        {
            getAward(8);
        }

        public function set afBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659363afBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1421659363afBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn4", _local_2, _arg_1));
            };
        }

        public function set afBtn8(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659359afBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1421659359afBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn8", _local_2, _arg_1));
            };
        }

        public function set afBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659366afBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1421659366afBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn1", _local_2, _arg_1));
            };
        }

        public function __afBtn2_click(_arg_1:MouseEvent):void
        {
            attackFloor(2);
        }

        public function set afBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659361afBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1421659361afBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn6", _local_2, _arg_1));
            };
        }

        public function set afBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659360afBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1421659360afBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn7", _local_2, _arg_1));
            };
        }

        public function set afBtn9(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1421659358afBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1421659358afBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "afBtn9", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            var _local_2:BagPanel;
            var _local_3:Boolean;
            if (_arg_1)
            {
                _local_2 = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                _local_3 = _local_2.goldLockFlag;
                if (((!(_local_3 == false)) && (_local_2)))
                {
                    _local_2.goldLockFlag = false;
                };
            };
        }

        private function _NineBossPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NINE_BOSS[0];
            _local_1 = Language.NINE_BOSS[12];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[13];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[14];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[15];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[16];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[17];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[18];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[19];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[20];
            _local_1 = Language.NINE_BOSS[10];
            _local_1 = Language.NINE_BOSS[21];
            _local_1 = Language.NINE_BOSS[34];
            _local_1 = Language.NINE_BOSS[1];
            _local_1 = Language.NINE_BOSS[2];
            _local_1 = Language.NINE_BOSS[3];
            _local_1 = Language.NINE_BOSS[4];
            _local_1 = Language.NINE_BOSS[5];
            _local_1 = Language.NINE_BOSS[6];
            _local_1 = Language.NINE_BOSS[7];
            _local_1 = Language.NINE_BOSS[8];
            _local_1 = Language.NINE_BOSS[9];
            _local_1 = Language.NINE_BOSS[10];
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn5():BasicGlowButton
        {
            return (this._1254502061gaBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn6():BasicGlowButton
        {
            return (this._1254502060gaBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn0():BasicGlowButton
        {
            return (this._1254502066gaBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn1():BasicGlowButton
        {
            return (this._1254502065gaBtn1);
        }

        public function __afBtn6_click(_arg_1:MouseEvent):void
        {
            attackFloor(6);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn3():BasicGlowButton
        {
            return (this._1254502063gaBtn3);
        }

        public function set tabBtn8(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141551tabBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1554141551tabBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn9():BasicGlowButton
        {
            return (this._1254502057gaBtn9);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn2():BasicGlowButton
        {
            return (this._1254502064gaBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn4():BasicGlowButton
        {
            return (this._1254502062gaBtn4);
        }

        public function set bossImg(_arg_1:Image):void
        {
            var _local_2:Object = this._68587798bossImg;
            if (_local_2 !== _arg_1)
            {
                this._68587798bossImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossImg", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn7():BasicGlowButton
        {
            return (this._1254502059gaBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn8():BasicGlowButton
        {
            return (this._1254502058gaBtn8);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        public function __gaBtn1_click(_arg_1:MouseEvent):void
        {
            getAward(1);
        }

        public function __tabBtn8_click(_arg_1:MouseEvent):void
        {
            tabClick(8);
        }

        public function __gaBtn5_click(_arg_1:MouseEvent):void
        {
            getAward(5);
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabClick(4);
        }

        public function __gaBtn9_click(_arg_1:MouseEvent):void
        {
            getAward(9);
        }

        public function set tabBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141553tabBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1554141553tabBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn6", _local_2, _arg_1));
            };
        }

        public function set gaBtn10(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._234858303gaBtn10;
            if (_local_2 !== _arg_1)
            {
                this._234858303gaBtn10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn10", _local_2, _arg_1));
            };
        }

        public function __afBtn3_click(_arg_1:MouseEvent):void
        {
            attackFloor(3);
        }

        public function set tabBtn9(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141550tabBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1554141550tabBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn6():BasicGlowButton
        {
            return (this._1554141553tabBtn6);
        }

        override public function initialize():void
        {
            var target:NineBossPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NineBossPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NineBossPanelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn8():BasicGlowButton
        {
            return (this._1554141551tabBtn8);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn9():BasicGlowButton
        {
            return (this._1554141550tabBtn9);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():BasicGlowButton
        {
            return (this._1554141554tabBtn5);
        }

        public function __afBtn7_click(_arg_1:MouseEvent):void
        {
            attackFloor(7);
        }

        [Bindable(event="propertyChange")]
        public function get ca1():Canvas
        {
            return (this._98195ca1);
        }

        public function set gaBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502066gaBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1254502066gaBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn0", _local_2, _arg_1));
            };
        }

        public function set gaBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502065gaBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1254502065gaBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        public function set gaBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502063gaBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1254502063gaBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn3", _local_2, _arg_1));
            };
        }

        public function set gaBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502061gaBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1254502061gaBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn5", _local_2, _arg_1));
            };
        }

        private function getAward(floorId:int):void
        {
            var handler:Function;
            var str:String;
            var tf:IUITextField;
            if ((((!(floorId)) || (floorId < 0)) || (floorId > 10)))
            {
                return;
            };
            if (floorId >= 1)
            {
                handler = function (event:CloseEvent):void
                {
                    var bagPanel:BagPanel;
                    var goldLockFlag:Boolean;
                    var gfunc:Function;
                    if (event.detail == Alert.YES)
                    {
                        if (floorId < 10)
                        {
                            _core.remote.call("getNineBossAward", new Responder(onInitPanel), floorId, 2);
                        }
                        else
                        {
                            if (floorId == 10)
                            {
                                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                                goldLockFlag = bagPanel.goldLockFlag;
                                if (((goldLockFlag) || (!(bagPanel))))
                                {
                                    _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                                    gfunc = function (_arg_1:String):void
                                    {
                                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                                    };
                                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                                    return;
                                };
                                _core.remote.call("getNineBossAward", new Responder(onInitPanel), floorId, 1);
                            };
                        };
                    };
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                str = Language.NINE_BOSS[32].toString().replace("{num}", _finishTopFloor);
                if (floorId == 10)
                {
                    str = Language.NINE_BOSS[11].toString().replace("{gold}", 20).replace("{num}", _topFloor);
                };
                _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = str;
                tf.filters = GamePredef.FILTER_TEXT1;
            }
            else
            {
                _core.remote.call("getNineBossAward", null, floorId, 2);
            };
        }

        public function set gaBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502060gaBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1254502060gaBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn6", _local_2, _arg_1));
            };
        }

        public function __gaBtn10_click(_arg_1:MouseEvent):void
        {
            getAward(10);
        }

        public function set gaBtn8(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502058gaBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1254502058gaBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn8", _local_2, _arg_1));
            };
        }

        public function set gaBtn9(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502057gaBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1254502057gaBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn9", _local_2, _arg_1));
            };
        }

        public function set bossInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._2126222779bossInfo;
            if (_local_2 !== _arg_1)
            {
                this._2126222779bossInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn7():BasicGlowButton
        {
            return (this._1554141552tabBtn7);
        }

        public function onInitPanel(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:int;
            var _local_5:int;
            if (_arg_1)
            {
                _local_2 = _arg_1.f;
                _finishTopFloor = 0;
                _topFloor = _local_2;
                if (_local_2)
                {
                    _local_4 = 1;
                    while (_local_4 <= _local_2)
                    {
                        this[("afBtn" + _local_4)].enabled = true;
                        _local_4++;
                    };
                    if (_local_2 < 9)
                    {
                        _local_5 = (_local_2 + 1);
                        this[("afBtn" + _local_5)].enabled = true;
                    };
                    if (_local_2 >= 1)
                    {
                        this.gaBtn10.enabled = true;
                    };
                }
                else
                {
                    _local_4 = 1;
                    while (_local_4 <= 9)
                    {
                        this[("afBtn" + _local_4)].enabled = false;
                        this[("gaBtn" + _local_4)].enabled = false;
                        _local_4++;
                    };
                    this.gaBtn10.enabled = false;
                    this.afBtn1.enabled = true;
                    this.visible = true;
                    return;
                };
                _local_3 = _arg_1.df;
                if (_local_3)
                {
                    if (_local_3[3] <= _local_3[1])
                    {
                        this.gaBtn0.enabled = false;
                        this.gaBtn10.enabled = false;
                    }
                    else
                    {
                        _local_4 = 9;
                        while (_local_4 >= 1)
                        {
                            if (((_local_3[2]) && (_local_3[2].toString().indexOf(_local_4) >= 0)))
                            {
                                _finishTopFloor = _local_4;
                                break;
                            };
                            _local_4--;
                        };
                        this.gaBtn0.enabled = true;
                        this.gaBtn10.enabled = true;
                    };
                };
                this.visible = true;
            };
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabClick(5);
        }

        public function __gaBtn2_click(_arg_1:MouseEvent):void
        {
            getAward(2);
        }

        private function attackFloor(_arg_1:int):void
        {
            if ((((!(_arg_1)) || (_arg_1 < 0)) || (_arg_1 > 9)))
            {
                return;
            };
            _core.remote.call("attachThisFloorBoss", null, _arg_1);
        }

        public function __gaBtn6_click(_arg_1:MouseEvent):void
        {
            getAward(6);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        public function __afBtn8_click(_arg_1:MouseEvent):void
        {
            attackFloor(8);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get gaBtn10():BasicGlowButton
        {
            return (this._234858303gaBtn10);
        }

        public function set gaBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502062gaBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1254502062gaBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn4", _local_2, _arg_1));
            };
        }

        public function __tabBtn9_click(_arg_1:MouseEvent):void
        {
            tabClick(9);
        }

        public function __afBtn4_click(_arg_1:MouseEvent):void
        {
            attackFloor(4);
        }

        public function set gaBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502059gaBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1254502059gaBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn7", _local_2, _arg_1));
            };
        }

        public function set gaBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1254502064gaBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1254502064gaBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gaBtn2", _local_2, _arg_1));
            };
        }

        public function initNineBossPanel():void
        {
            if (((_core) && (_core.cid)))
            {
                _core.remote.call("initNineFloorPanel", new Responder(onInitPanel));
            };
            if (_firstflag)
            {
                if (this.bossImg)
                {
                    this.bossImg.source = ResManager.getIconUrl(parseInt("3130090000038"));
                    if (this.bossInfo)
                    {
                        this.bossInfo.text = Language.NINE_BOSS[33];
                    };
                    if (this.tabBtn0)
                    {
                        this.tabBtn0.selected = true;
                    };
                    _firstflag = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get bossInfo():IntroText
        {
            return (this._2126222779bossInfo);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        private function tabClick(_arg_1:int):void
        {
            var _local_2:*;
            var _local_3:Number;
            if (this[("tabBtn" + _arg_1)])
            {
                _local_2 = 0;
                while (_local_2 <= 9)
                {
                    if (this[("tabBtn" + _local_2)])
                    {
                        this[("tabBtn" + _local_2)].selected = false;
                    };
                    _local_2++;
                };
                this[("tabBtn" + _arg_1)].selected = true;
            };
            if (((!(_arg_1)) || (_arg_1 == 0)))
            {
                this.bossInfo.text = Language.NINE_BOSS[33];
            }
            else
            {
                if (GamePredef.NINE_BOSS_ICON[_arg_1])
                {
                    this.bossImg.source = ResManager.hash(ResManager.getIconUrlNoHash(GamePredef.NINE_BOSS_ICON[_arg_1]));
                };
                if (this.bossInfo)
                {
                    _local_3 = (Number(_arg_1) + 21);
                    this.bossInfo.text = Language.NINE_BOSS[_local_3];
                };
            };
        }

        public function __tabBtn6_click(_arg_1:MouseEvent):void
        {
            tabClick(6);
        }

        public function __gaBtn3_click(_arg_1:MouseEvent):void
        {
            getAward(3);
        }

        private function _NineBossPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NineBossPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_NineBossPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn1.label = _arg_1;
            }, "afBtn1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn1.label = _arg_1;
            }, "gaBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn2.label = _arg_1;
            }, "afBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn2.label = _arg_1;
            }, "gaBtn2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn3.label = _arg_1;
            }, "afBtn3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn3.label = _arg_1;
            }, "gaBtn3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn4.label = _arg_1;
            }, "afBtn4.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn4.label = _arg_1;
            }, "gaBtn4.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn5.label = _arg_1;
            }, "afBtn5.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn5.label = _arg_1;
            }, "gaBtn5.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn6.label = _arg_1;
            }, "afBtn6.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn6.label = _arg_1;
            }, "gaBtn6.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn7.label = _arg_1;
            }, "afBtn7.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn7.label = _arg_1;
            }, "gaBtn7.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn8.label = _arg_1;
            }, "afBtn8.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn8.label = _arg_1;
            }, "gaBtn8.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                afBtn9.label = _arg_1;
            }, "afBtn9.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn9.label = _arg_1;
            }, "gaBtn9.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn10.label = _arg_1;
            }, "gaBtn10.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn6.label = _arg_1;
            }, "tabBtn6.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn7.label = _arg_1;
            }, "tabBtn7.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn8.label = _arg_1;
            }, "tabBtn8.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn9.label = _arg_1;
            }, "tabBtn9.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NINE_BOSS[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gaBtn0.label = _arg_1;
            }, "gaBtn0.label");
            result[30] = binding;
            return (result);
        }

        public function __gaBtn7_click(_arg_1:MouseEvent):void
        {
            getAward(7);
        }


    }
}//package com.qeedoo.ui.view.compDragable


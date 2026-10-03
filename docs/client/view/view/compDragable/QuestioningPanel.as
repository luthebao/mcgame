// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.QuestioningPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.RadioButton;
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import mx.controls.DataGrid;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.MultiLineButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import flash.utils.setTimeout;
    import flash.net.Responder;
    import flash.events.Event;
    import mx.events.CloseEvent;
    import mx.events.ListEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import mx.events.MenuEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
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

    public class QuestioningPanel extends DragableCanvas implements IBindingClient 
    {

        private static const ANIMATION_QUESTION_RIGHT:Class = QuestioningPanel_ANIMATION_QUESTION_RIGHT;
        private static const ANIMATION_QUESTION_WRONG:Class = QuestioningPanel_ANIMATION_QUESTION_WRONG;
        private static const ICON_QUESTION_XLY:Class = QuestioningPanel_ICON_QUESTION_XLY;
        private static const ICON_QUESTION_FDJ:Class = QuestioningPanel_ICON_QUESTION_FDJ;
        private static const ICON_QUESTION_XYX:Class = QuestioningPanel_ICON_QUESTION_XYX;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var question_writing_time:Number = 15000;
        private var _3694972xyx3:Image;
        private var _qNum:Number = -1;
        private var _3526474seld:RadioButton;
        private var _3682508xly1:Image;
        private var setTime:Timer = null;
        private var xyxRemainTime:int = 3;
        private var _selectedAnswer:RadioButton;
        private var question_reading_time:Number = 10000;
        private var time_for_start:int = 120;
        private var _core:Core;
        private var _3138117fdj1:Image;
        private var time_for_read:int = 10;
        private var _3694971xyx2:Image;
        private var _172500916questionGrid:DataGrid;
        private var _curAns:String = "A";
        private var _1693501890answerCvs:Canvas;
        private var _1378835600btnFDJ:MultiLineButton;
        public var _QuestioningPanel_DataGridColumn1:DataGridColumn;
        private var _3526473selc:RadioButton;
        public var _QuestioningPanel_DataGridColumn2:DataGridColumn;
        public var _QuestioningPanel_BasicTxtButton3:BasicTxtButton;
        public var _QuestioningPanel_BasicTxtButton5:BasicTxtButton;
        public var _QuestioningPanel_BasicTxtButton7:BasicTxtButton;
        private var _869812602remainNum:BasicTxtButton;
        private var _3682510xly3:Image;
        private var _1378817637btnXYX:MultiLineButton;
        private var _1378818039btnXLY:MultiLineButton;
        private var _172294920questionNote:TextArea;
        private var _3694970xyx1:Image;
        private var _3434543qCvs:Canvas;
        private var _849909678totalPnt:BasicTxtButton;
        private var _1322604301eTitle:BasicTitleCanvas;
        private var _3526472selb:RadioButton;
        private var _3449856qStr:IntroText;
        private var xlyRemainTime:int = 3;
        private var _317444454answerAnimation:Image;
        private var canUseItem:Boolean = false;
        private var _1194520270remainSecs:BasicTxtButton;
        private var _720230806totalOrder:BasicTxtButton;
        private var _2076492010timerTip:BasicTxtButton;
        private var _3138119fdj3:Image;
        public var _QuestioningPanel_BasicGlowButton1:BasicGlowButton;
        private var _3526471sela:RadioButton;
        public var hideAble:* = false;
        private var rightOrWrong:int = 0;
        private var _3682509xly2:Image;
        private var totalQuestionNum:int = 30;
        private var fdjRemainTime:int = 3;
        private var _3138118fdj2:Image;
        private var time_for_write:int = 15;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":650,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"eTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"qCvs",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":35,
                                "width":640,
                                "height":450,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "width":470,
                                            "height":120,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"qStr",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 16;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"answerAnimation",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":110,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"answerCvs",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":130,
                                            "width":470,
                                            "height":315,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"sela",
                                                "events":{"click":"__sela_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":15,
                                                        "visible":false,
                                                        "width":280,
                                                        "height":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"selb",
                                                "events":{"click":"__selb_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":50,
                                                        "visible":false,
                                                        "width":280,
                                                        "height":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"selc",
                                                "events":{"click":"__selc_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":85,
                                                        "visible":false,
                                                        "width":280,
                                                        "height":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"seld",
                                                "events":{"click":"__seld_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":120,
                                                        "visible":false,
                                                        "width":280,
                                                        "height":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"timerTip",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":29,
                                                        "y":170,
                                                        "height":35,
                                                        "width":120
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"remainSecs",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":154,
                                                        "y":170,
                                                        "height":35,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_QuestioningPanel_BasicTxtButton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":170,
                                                        "height":35,
                                                        "width":120
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"remainNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":383,
                                                        "y":170,
                                                        "height":35,
                                                        "width":55
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":205,
                                                        "width":460,
                                                        "height":105,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":460,
                                                                    "height":105,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":MultiLineButton,
                                                                        "id":"btnXLY",
                                                                        "events":{"click":"__btnXLY_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":148,
                                                                                "height":100,
                                                                                "styleName":"BtnQuestItem"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MultiLineButton,
                                                                        "id":"btnFDJ",
                                                                        "events":{"click":"__btnFDJ_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":148,
                                                                                "height":100,
                                                                                "styleName":"BtnQuestItem"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MultiLineButton,
                                                                        "id":"btnXYX",
                                                                        "events":{"click":"__btnXYX_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":148,
                                                                                "height":100,
                                                                                "styleName":"BtnQuestItem"
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"xly1",
                                                            "events":{"click":"__xly1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"xly2",
                                                            "events":{"click":"__xly2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":65,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"xly3",
                                                            "events":{"click":"__xly3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fdj1",
                                                            "events":{"click":"__fdj1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":180,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fdj2",
                                                            "events":{"click":"__fdj2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":215,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"fdj3",
                                                            "events":{"click":"__fdj3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":250,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"xyx1",
                                                            "events":{"click":"__xyx1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":340,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"xyx2",
                                                            "events":{"click":"__xyx2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":375,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"xyx3",
                                                            "events":{"click":"__xyx3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":410,
                                                                    "y":5
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"questionNote",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                    this.textAlign = "left";
                                                    this.color = 16774324;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":306,
                                                        "y":21,
                                                        "height":125,
                                                        "width":154
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":480,
                                            "y":5,
                                            "width":155,
                                            "height":450,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"questionGrid",
                                                "events":{"itemDoubleClick":"__questionGrid_itemDoubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "doubleClickEnabled":true,
                                                        "height":259,
                                                        "draggableColumns":false,
                                                        "columns":[_QuestioningPanel_DataGridColumn1_i(), _QuestioningPanel_DataGridColumn2_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_QuestioningPanel_BasicTxtButton5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":352,
                                                        "width":102
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"totalPnt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":115,
                                                        "y":352,
                                                        "label":"0",
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_QuestioningPanel_BasicTxtButton7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":380,
                                                        "width":102
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"totalOrder",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":115,
                                                        "y":380,
                                                        "label":"30",
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_QuestioningPanel_BasicGlowButton1",
                                                "events":{"click":"___QuestioningPanel_BasicGlowButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":87,
                                                        "y":408,
                                                        "width":60,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _qObj:Object = {};
        private var _1024893362questionerArr:Array = [];
        private var serverArgs:Object = {};
        private var tempHeight:Array = [];
        private var temp2Height:Array = [];
        private var answerHeight:Array = [15, 50, 85, 120];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function QuestioningPanel()
        {
            mx_internal::_document = this;
            this.width = 650;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___QuestioningPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QuestioningPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get qStr():IntroText
        {
            return (this._3449856qStr);
        }

        public function showQuestion(_arg_1:Object):void
        {
            if (!initialized)
            {
                serverArgs = _arg_1;
                addEventListener(FlexEvent.CREATION_COMPLETE, showQuestionLater);
                return;
            };
            if (setTime)
            {
                setTime.stop();
                setTime.removeEventListener(TimerEvent.TIMER, onWriteTime);
                setTime.removeEventListener(TimerEvent.TIMER, onReadTime);
                setTime.removeEventListener(TimerEvent.TIMER, onWaitingTime);
                setTime = null;
            };
            time_for_read = Math.ceil((question_reading_time / 1000));
            setTime = new Timer(1000, time_for_read);
            setTime.addEventListener(TimerEvent.TIMER, onReadTime);
            setTime.start();
            time_for_write = Math.ceil((question_writing_time / 1000));
            timerTip.label = Language.QUESTIONING_PANEL_U[31];
            remainSecs.text = Language.QUESTIONING_PANEL_U[8].replace("{sec}", time_for_read);
            remainSecs.setStyle("color", "#FFFFFF");
            if (!qCvs.visible)
            {
                qCvs.visible = true;
            };
            if (_selectedAnswer)
            {
                _selectedAnswer.selected = false;
            };
            _qNum = (_arg_1.qnum - -1);
            remainNum.text = (totalQuestionNum - _qNum).toString();
            rightOrWrong = 0;
            if (ToolKit.isBigThan(_qNum, 0))
            {
                _qObj = _core.data.gameData[GamePredef.TBL_ANSWER][_arg_1.qid];
                if (_qObj)
                {
                    qStr.text = ((_qNum + ".") + _qObj.t);
                    sela.label = ((_qObj.a) ? ("A." + _qObj.a) : "");
                    selb.label = ((_qObj.b) ? ("B." + _qObj.b) : "");
                    selc.label = ((_qObj.c) ? ("C." + _qObj.c) : "");
                    seld.label = ((_qObj.d) ? ("D." + _qObj.d) : "");
                    sela.y = getHeight(1);
                    selb.y = getHeight(2);
                    selc.y = getHeight(3);
                    seld.y = getHeight(4);
                    sela.visible = ((_qObj.a) ? true : false);
                    selb.visible = ((_qObj.b) ? true : false);
                    selc.visible = ((_qObj.c) ? true : false);
                    seld.visible = ((_qObj.d) ? true : false);
                };
            };
            canUseItem = true;
        }

        public function set qStr(_arg_1:IntroText):void
        {
            var _local_2:Object = this._3449856qStr;
            if (_local_2 !== _arg_1)
            {
                this._3449856qStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qStr", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnXLY():MultiLineButton
        {
            return (this._1378818039btnXLY);
        }

        public function set btnXLY(_arg_1:MultiLineButton):void
        {
            var _local_2:Object = this._1378818039btnXLY;
            if (_local_2 !== _arg_1)
            {
                this._1378818039btnXLY = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnXLY", _local_2, _arg_1));
            };
        }

        private function getHeight(_arg_1:int):int
        {
            var _local_2:*;
            if (temp2Height.length == 0)
            {
                for (_local_2 in answerHeight)
                {
                    tempHeight[_local_2] = answerHeight[_local_2];
                };
                temp2Height = randomArray(tempHeight);
            };
            return (temp2Height.pop());
        }

        public function set timerTip(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._2076492010timerTip;
            if (_local_2 !== _arg_1)
            {
                this._2076492010timerTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timerTip", _local_2, _arg_1));
            };
        }

        private function onWriteTime(_arg_1:TimerEvent):void
        {
            time_for_write--;
            if (time_for_write <= 3)
            {
                remainSecs.setStyle("color", "#FF0000");
            }
            else
            {
                if (time_for_write <= 8)
                {
                    remainSecs.setStyle("color", "#00FF00");
                };
            };
            if (time_for_write == 0)
            {
                canUseItem = false;
                setTime.stop();
                setTime.removeEventListener(TimerEvent.TIMER, onWriteTime);
                setTime = null;
            };
            remainSecs.label = String(Language.QUESTIONING_PANEL_U[8]).replace("{sec}", time_for_write);
        }

        public function __fdj2_click(_arg_1:MouseEvent):void
        {
            btnFDJ.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function __xly1_click(_arg_1:MouseEvent):void
        {
            btnXLY.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function addQuestionNote(_arg_1:String):void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:String;
            questionNote.text = (questionNote.text + ("\r" + _arg_1));
            var _local_2:Array = questionNote.text.split("\r");
            if ((_local_2.length - 1) > 4)
            {
                _local_3 = 0;
                while (_local_3 <= ((_local_2.length - 1) - 4))
                {
                    _local_4 = questionNote.text;
                    _local_5 = _local_4.slice(0, (_local_4.indexOf("\r") + 1));
                    questionNote.text = _local_4.replace(_local_5, "");
                    _local_3++;
                };
            };
        }

        public function __seld_click(_arg_1:MouseEvent):void
        {
            selAnswer(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get qCvs():Canvas
        {
            return (this._3434543qCvs);
        }

        [Bindable(event="propertyChange")]
        public function get fdj1():Image
        {
            return (this._3138117fdj1);
        }

        [Bindable(event="propertyChange")]
        public function get fdj2():Image
        {
            return (this._3138118fdj2);
        }

        [Bindable(event="propertyChange")]
        public function get fdj3():Image
        {
            return (this._3138119fdj3);
        }

        private function showQuestionLater(_arg_1:FlexEvent):void
        {
            showQuestion(serverArgs);
            removeEventListener(FlexEvent.CREATION_COMPLETE, showQuestionLater);
        }

        [Bindable(event="propertyChange")]
        public function get questionGrid():DataGrid
        {
            return (this._172500916questionGrid);
        }

        [Bindable(event="propertyChange")]
        private function get questionerArr():Array
        {
            return (this._1024893362questionerArr);
        }

        [Bindable(event="propertyChange")]
        public function get totalPnt():BasicTxtButton
        {
            return (this._849909678totalPnt);
        }

        public function set qCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3434543qCvs;
            if (_local_2 !== _arg_1)
            {
                this._3434543qCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qCvs", _local_2, _arg_1));
            };
        }

        private function hideAnimation():void
        {
            answerAnimation.source = "";
            answerAnimation.visible = false;
        }

        public function __xyx1_click(_arg_1:MouseEvent):void
        {
            btnXYX.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        [Bindable(event="propertyChange")]
        public function get totalOrder():BasicTxtButton
        {
            return (this._720230806totalOrder);
        }

        public function __sela_click(_arg_1:MouseEvent):void
        {
            selAnswer(_arg_1);
        }

        public function onSubApp(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1.apply)
            {
                Alert.show(Language.QUESTIONING_PANEL_U[33], "", Alert.YES, null, null);
                return;
            };
            if (_arg_1.f)
            {
                addQuestionNote(Language.QUESTIONING_PANEL_U[16]);
                if (((_arg_1.rtime) && (_arg_1.wtime)))
                {
                    question_reading_time = _arg_1.rtime;
                    question_writing_time = _arg_1.wtime;
                    time_for_read = Math.ceil((question_reading_time / 1000));
                    time_for_write = Math.ceil((question_writing_time / 1000));
                };
                totalQuestionNum = _arg_1.qnum;
                questionerArr = new Array();
                qCvs.visible = true;
                _local_2 = 1;
                while (_local_2 <= 3)
                {
                    this[("xly" + _local_2)].visible = true;
                    this[("fdj" + _local_2)].visible = true;
                    this[("xyx" + _local_2)].visible = true;
                    _local_2++;
                };
                this.btnFDJ.enabled = true;
                this.btnXLY.enabled = true;
                this.btnXYX.enabled = true;
                if (_arg_1.sec)
                {
                    if (ToolKit.isBigThan(_arg_1.sec, 0))
                    {
                        addQuestionNote(String(Language.QUESTIONING_PANEL_U[29]).replace("{sec}", _arg_1.sec));
                        timerTip.text = Language.QUESTIONING_PANEL_U[32];
                        remainSecs.text = Language.QUESTIONING_PANEL_U[8].replace("{sec}", _arg_1.sec);
                        time_for_start = Number(_arg_1.sec);
                        if (setTime)
                        {
                            setTime.stop();
                            setTime.removeEventListener(TimerEvent.TIMER, onWriteTime);
                            setTime.removeEventListener(TimerEvent.TIMER, onReadTime);
                            setTime.removeEventListener(TimerEvent.TIMER, onWaitingTime);
                            setTime = null;
                        };
                        setTime = new Timer(1000);
                        setTime.addEventListener(TimerEvent.TIMER, onWaitingTime);
                        setTime.start();
                    };
                };
            }
            else
            {
                addQuestionNote(Language.QUESTIONING_PANEL_U[17]);
                setTimeout(closePanel, 2000);
            };
        }

        private function onReadTime(_arg_1:TimerEvent):void
        {
            time_for_read--;
            if (time_for_read == 0)
            {
                setTime.stop();
                setTime.removeEventListener(TimerEvent.TIMER, onReadTime);
                setTime = null;
                timerTip.label = Language.QUESTIONING_PANEL_U[7];
                remainSecs.label = String(Language.QUESTIONING_PANEL_U[8]).replace("{sec}", time_for_write);
                remainSecs.setStyle("color", "#FFFFFF");
                setTime = new Timer(1000, time_for_write);
                setTime.addEventListener(TimerEvent.TIMER, onWriteTime);
                setTime.start();
                return;
            };
            remainSecs.label = String(Language.QUESTIONING_PANEL_U[8]).replace("{sec}", time_for_read);
        }

        public function set fdj1(_arg_1:Image):void
        {
            var _local_2:Object = this._3138117fdj1;
            if (_local_2 !== _arg_1)
            {
                this._3138117fdj1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fdj1", _local_2, _arg_1));
            };
        }

        public function set fdj3(_arg_1:Image):void
        {
            var _local_2:Object = this._3138119fdj3;
            if (_local_2 !== _arg_1)
            {
                this._3138119fdj3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fdj3", _local_2, _arg_1));
            };
        }

        public function set selb(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3526472selb;
            if (_local_2 !== _arg_1)
            {
                this._3526472selb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selb", _local_2, _arg_1));
            };
        }

        public function set selc(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3526473selc;
            if (_local_2 !== _arg_1)
            {
                this._3526473selc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selc", _local_2, _arg_1));
            };
        }

        public function set fdj2(_arg_1:Image):void
        {
            var _local_2:Object = this._3138118fdj2;
            if (_local_2 !== _arg_1)
            {
                this._3138118fdj2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fdj2", _local_2, _arg_1));
            };
        }

        public function set sela(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3526471sela;
            if (_local_2 !== _arg_1)
            {
                this._3526471sela = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sela", _local_2, _arg_1));
            };
        }

        public function set questionGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._172500916questionGrid;
            if (_local_2 !== _arg_1)
            {
                this._172500916questionGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questionGrid", _local_2, _arg_1));
            };
        }

        private function set questionerArr(_arg_1:Array):void
        {
            var _local_2:Object = this._1024893362questionerArr;
            if (_local_2 !== _arg_1)
            {
                this._1024893362questionerArr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questionerArr", _local_2, _arg_1));
            };
        }

        public function set seld(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3526474seld;
            if (_local_2 !== _arg_1)
            {
                this._3526474seld = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seld", _local_2, _arg_1));
            };
        }

        public function set totalPnt(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._849909678totalPnt;
            if (_local_2 !== _arg_1)
            {
                this._849909678totalPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalPnt", _local_2, _arg_1));
            };
        }

        private function viewClear():void
        {
            qStr.text = "";
            sela.visible = false;
            selb.visible = false;
            selc.visible = false;
            seld.visible = false;
            remainSecs.text = "";
            remainNum.text = "";
            totalPnt.text = "0";
            totalOrder.text = "0";
            if (setTime)
            {
                setTime.stop();
                setTime.removeEventListener(TimerEvent.TIMER, onWriteTime);
                setTime.removeEventListener(TimerEvent.TIMER, onReadTime);
                setTime.removeEventListener(TimerEvent.TIMER, onWaitingTime);
                setTime = null;
            };
        }

        public function onQuestionRank(_arg_1:Object):void
        {
            var _local_4:String;
            var _local_5:Number;
            if (rightOrWrong == 1)
            {
                addQuestionNote(Language.QUESTIONING_PANEL_U[11]);
                showAnimation(true);
            }
            else
            {
                if (rightOrWrong == -1)
                {
                    addQuestionNote(Language.QUESTIONING_PANEL_U[12]);
                    showAnimation(false);
                };
            };
            rightOrWrong = 0;
            var _local_2:Array = _arg_1.rank;
            var _local_3:Object = _arg_1.self;
            if (_local_3)
            {
                totalOrder.text = ((_local_3.order) ? (_local_3.order - -1).toString() : "0");
                totalPnt.text = ((_local_3.pnt) ? _local_3.pnt : "0");
            };
            if (_local_2)
            {
                for (_local_4 in _local_2)
                {
                    _local_5 = GamePredef.MAP_ID_BY_CLASS[_local_2[_local_4].cl];
                    _local_2[_local_4].cl = _core.data.gameData[GamePredef.TBL_MAP][_local_5].name;
                };
                questionerArr = _local_2;
            };
        }

        public function __xly3_click(_arg_1:MouseEvent):void
        {
            btnXLY.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        private function selAnswer(_arg_1:Event):void
        {
            if (!ToolKit.isEqual(rightOrWrong, 0))
            {
                _selectedAnswer.selected = true;
                return;
            };
            switch (_arg_1.currentTarget.id)
            {
                case "sela":
                    _curAns = "A";
                    break;
                case "selb":
                    _curAns = "B";
                    break;
                case "selc":
                    _curAns = "C";
                    break;
                case "seld":
                    _curAns = "D";
                    break;
            };
            if (((time_for_read == 0) && (time_for_write > 0)))
            {
                _selectedAnswer = RadioButton(_arg_1.currentTarget);
                _core.remote.call("subAnswer", new Responder(onSubAnswer), _curAns);
            }
            else
            {
                _arg_1.currentTarget.selected = false;
                if (time_for_read > 0)
                {
                    addQuestionNote(Language.QUESTIONING_PANEL_U[9]);
                }
                else
                {
                    if (time_for_write <= 0)
                    {
                        addQuestionNote(Language.QUESTIONING_PANEL_U[10]);
                    };
                };
            };
        }

        private function checkDropEvent():void
        {
            var func:Function = function (_arg_1:CloseEvent):*
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("dropQuestion", null, null);
                };
            };
            Alert.show(Language.QUESTIONING_PANEL_U[21], "", (Alert.YES | Alert.NO), null, func);
        }

        public function set answerAnimation(_arg_1:Image):void
        {
            var _local_2:Object = this._317444454answerAnimation;
            if (_local_2 !== _arg_1)
            {
                this._317444454answerAnimation = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "answerAnimation", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xly2():Image
        {
            return (this._3682509xly2);
        }

        [Bindable(event="propertyChange")]
        public function get remainSecs():BasicTxtButton
        {
            return (this._1194520270remainSecs);
        }

        [Bindable(event="propertyChange")]
        public function get xly1():Image
        {
            return (this._3682508xly1);
        }

        public function set totalOrder(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._720230806totalOrder;
            if (_local_2 !== _arg_1)
            {
                this._720230806totalOrder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalOrder", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xly3():Image
        {
            return (this._3682510xly3);
        }

        public function set btnFDJ(_arg_1:MultiLineButton):void
        {
            var _local_2:Object = this._1378835600btnFDJ;
            if (_local_2 !== _arg_1)
            {
                this._1378835600btnFDJ = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFDJ", _local_2, _arg_1));
            };
        }

        public function __xyx3_click(_arg_1:MouseEvent):void
        {
            btnXYX.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        private function closePanel():void
        {
            this.visible = false;
        }

        public function __fdj1_click(_arg_1:MouseEvent):void
        {
            btnFDJ.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function __selc_click(_arg_1:MouseEvent):void
        {
            selAnswer(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get eTitle():BasicTitleCanvas
        {
            return (this._1322604301eTitle);
        }

        public function set xyx2(_arg_1:Image):void
        {
            var _local_2:Object = this._3694971xyx2;
            if (_local_2 !== _arg_1)
            {
                this._3694971xyx2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xyx2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get questionNote():TextArea
        {
            return (this._172294920questionNote);
        }

        private function useXLY():void
        {
            var _local_1:Number;
            if (questionGrid.selectedItem)
            {
                _local_1 = questionGrid.selectedItem.cid;
                _core.remote.call("useXLY", new Responder(onUseXLY), _local_1);
            }
            else
            {
                addQuestionNote(Language.QUESTIONING_PANEL_U[26]);
            };
        }

        public function onSubAnswer(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 1:
                    rightOrWrong = 1;
                    return;
                case -1:
                    rightOrWrong = -1;
                    return;
                case 4:
                    addQuestionNote(Language.QUESTIONING_PANEL_U[13]);
                    return;
                case 3:
                    addQuestionNote(Language.QUESTIONING_PANEL_U[14]);
                    return;
                case 2:
                    addQuestionNote(Language.QUESTIONING_PANEL_U[15]);
                    return;
            };
        }

        public function ___QuestioningPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            checkDropEvent();
        }

        private function showAnimation(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                answerAnimation.source = ANIMATION_QUESTION_RIGHT;
            }
            else
            {
                answerAnimation.source = ANIMATION_QUESTION_WRONG;
            };
            answerAnimation.visible = true;
            setTimeout(hideAnimation, 2000);
        }

        public function set remainNum(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._869812602remainNum;
            if (_local_2 !== _arg_1)
            {
                this._869812602remainNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "remainNum", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            _core = Core.getInstance();
        }

        public function __questionGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function set xyx3(_arg_1:Image):void
        {
            var _local_2:Object = this._3694972xyx3;
            if (_local_2 !== _arg_1)
            {
                this._3694972xyx3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xyx3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timerTip():BasicTxtButton
        {
            return (this._2076492010timerTip);
        }

        public function set xyx1(_arg_1:Image):void
        {
            var _local_2:Object = this._3694970xyx1;
            if (_local_2 !== _arg_1)
            {
                this._3694970xyx1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xyx1", _local_2, _arg_1));
            };
        }

        public function onUseFDJ(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1)
            {
                if (_arg_1.f)
                {
                    if (this[("sel" + String(_arg_1.d).toLowerCase())])
                    {
                        addQuestionNote((Language.QUESTIONING_PANEL_U[18] + _arg_1.d));
                        this[("sel" + String(_arg_1.d).toLowerCase())].visible = false;
                    };
                    _local_2 = 3;
                    _local_3 = _arg_1.num;
                    while (_local_3 > 0)
                    {
                        this[("fdj" + _local_2)].visible = false;
                        _local_2--;
                        _local_3--;
                    };
                    if (_arg_1.num == 3)
                    {
                        btnFDJ.enabled = false;
                    };
                };
            };
        }

        public function ___QuestioningPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _QuestioningPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.QUESTIONING_PANEL_U[0];
            _local_1 = Language.QUESTIONING_PANEL_U[28];
            _local_1 = Language.QUESTIONING_PANEL_U[22];
            _local_1 = Language.QUESTIONING_PANEL_U[23];
            _local_1 = Language.QUESTIONING_PANEL_U[24];
            _local_1 = ICON_QUESTION_XLY;
            _local_1 = ICON_QUESTION_XLY;
            _local_1 = ICON_QUESTION_XLY;
            _local_1 = ICON_QUESTION_FDJ;
            _local_1 = ICON_QUESTION_FDJ;
            _local_1 = ICON_QUESTION_FDJ;
            _local_1 = ICON_QUESTION_XYX;
            _local_1 = ICON_QUESTION_XYX;
            _local_1 = ICON_QUESTION_XYX;
            _local_1 = questionerArr;
            _local_1 = Language.QUESTIONING_PANEL_U[1];
            _local_1 = Language.QUESTIONING_PANEL_U[3];
            _local_1 = Language.QUESTIONING_PANEL_U[4];
            _local_1 = Language.QUESTIONING_PANEL_U[5];
            _local_1 = Language.QUESTIONING_PANEL_U[25];
        }

        public function set btnXYX(_arg_1:MultiLineButton):void
        {
            var _local_2:Object = this._1378817637btnXYX;
            if (_local_2 !== _arg_1)
            {
                this._1378817637btnXYX = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnXYX", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sela():RadioButton
        {
            return (this._3526471sela);
        }

        [Bindable(event="propertyChange")]
        public function get selb():RadioButton
        {
            return (this._3526472selb);
        }

        [Bindable(event="propertyChange")]
        public function get selc():RadioButton
        {
            return (this._3526473selc);
        }

        public function onUseXYX(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1)
            {
                if (_arg_1.f)
                {
                    addQuestionNote(Language.QUESTIONING_PANEL_U[19]);
                    _local_2 = 3;
                    _local_3 = _arg_1.num;
                    while (_local_3 > 0)
                    {
                        this[("xyx" + _local_2)].visible = false;
                        _local_2--;
                        _local_3--;
                    };
                    if (_arg_1.num == 3)
                    {
                        btnXYX.enabled = false;
                    };
                };
            };
        }

        private function onWaitingTime(_arg_1:TimerEvent):void
        {
            time_for_start--;
            if (time_for_start == 0)
            {
                setTime.stop();
                setTime.removeEventListener(TimerEvent.TIMER, onWaitingTime);
                setTime = null;
            };
            remainSecs.label = String(Language.QUESTIONING_PANEL_U[8]).replace("{sec}", time_for_start);
        }

        internal function randomArray(_arg_1:*):*
        {
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = _arg_1.length;
            var _local_3:* = new Array();
            _local_4 = 0;
            while (_local_4 < _local_2)
            {
                _local_5 = Math.floor((Math.random() * _arg_1.length));
                _local_3.push(_arg_1[_local_5]);
                _arg_1.splice(_local_5, 1);
                _local_5++;
                _local_4++;
            };
            return (_local_3);
        }

        private function specialItem(_arg_1:Event):void
        {
            if (canUseItem)
            {
                switch (_arg_1.currentTarget.id)
                {
                    case "btnXLY":
                        useXLY();
                        return;
                    case "btnFDJ":
                        _core.remote.call("useFDJ", new Responder(onUseFDJ), null);
                        return;
                    case "btnXYX":
                        _core.remote.call("useXYX", new Responder(onUseXYX), null);
                        return;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get answerAnimation():Image
        {
            return (this._317444454answerAnimation);
        }

        public function __fdj3_click(_arg_1:MouseEvent):void
        {
            btnFDJ.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function __xly2_click(_arg_1:MouseEvent):void
        {
            btnXLY.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        [Bindable(event="propertyChange")]
        public function get remainNum():BasicTxtButton
        {
            return (this._869812602remainNum);
        }

        [Bindable(event="propertyChange")]
        public function get xyx2():Image
        {
            return (this._3694971xyx2);
        }

        [Bindable(event="propertyChange")]
        public function get xyx3():Image
        {
            return (this._3694972xyx3);
        }

        [Bindable(event="propertyChange")]
        public function get btnFDJ():MultiLineButton
        {
            return (this._1378835600btnFDJ);
        }

        [Bindable(event="propertyChange")]
        public function get xyx1():Image
        {
            return (this._3694970xyx1);
        }

        [Bindable(event="propertyChange")]
        public function get seld():RadioButton
        {
            return (this._3526474seld);
        }

        public function set answerCvs(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1693501890answerCvs;
            if (_local_2 !== _arg_1)
            {
                this._1693501890answerCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "answerCvs", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:QuestioningPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QuestioningPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_QuestioningPanelWatcherSetupUtil");
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

        public function set xly2(_arg_1:Image):void
        {
            var _local_2:Object = this._3682509xly2;
            if (_local_2 !== _arg_1)
            {
                this._3682509xly2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xly2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnXYX():MultiLineButton
        {
            return (this._1378817637btnXYX);
        }

        public function set xly1(_arg_1:Image):void
        {
            var _local_2:Object = this._3682508xly1;
            if (_local_2 !== _arg_1)
            {
                this._3682508xly1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xly1", _local_2, _arg_1));
            };
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (_arg_1.label == GamePredef.MENU_WISPER)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(_arg_1.item.name);
            }
            else
            {
                if (_arg_1.label == GamePredef.MENU_P2PWISPER)
                {
                    ChatPanelUtil.createChatPanel(_arg_1.item.id);
                }
                else
                {
                    if (_arg_1.label == GamePredef.MENU_INFO)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_arg_1.item.id);
                    }
                    else
                    {
                        if (_arg_1.label == GamePredef.MENU_ADDF)
                        {
                            _core.addFriend(_arg_1.item.name);
                        }
                        else
                        {
                            if (_arg_1.label == GamePredef.MENU_ADDB)
                            {
                                _core.addBlack(_arg_1.item.name);
                            };
                        };
                    };
                };
            };
        }

        public function __xyx2_click(_arg_1:MouseEvent):void
        {
            btnXYX.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function set remainSecs(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1194520270remainSecs;
            if (_local_2 !== _arg_1)
            {
                this._1194520270remainSecs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "remainSecs", _local_2, _arg_1));
            };
        }

        private function _QuestioningPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _QuestioningPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "pnt";
            BindingManager.executeBindings(this, "_QuestioningPanel_DataGridColumn2", _QuestioningPanel_DataGridColumn2);
            return (_local_1);
        }

        public function __selb_click(_arg_1:MouseEvent):void
        {
            selAnswer(_arg_1);
        }

        public function __btnXLY_click(_arg_1:MouseEvent):void
        {
            specialItem(_arg_1);
        }

        public function set xly3(_arg_1:Image):void
        {
            var _local_2:Object = this._3682510xly3;
            if (_local_2 !== _arg_1)
            {
                this._3682510xly3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xly3", _local_2, _arg_1));
            };
        }

        public function onUseXLY(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1)
            {
                if (_arg_1.f)
                {
                    addQuestionNote((Language.QUESTIONING_PANEL_U[20] + _arg_1.a));
                    if (this[("sel" + String(_arg_1.a).toLowerCase())])
                    {
                        _selectedAnswer = this[("sel" + String(_arg_1.a).toLowerCase())];
                        _selectedAnswer.selected = true;
                    };
                    _local_2 = 3;
                    _local_3 = _arg_1.num;
                    while (_local_3 > 0)
                    {
                        this[("xly" + _local_2)].visible = false;
                        _local_2--;
                        _local_3--;
                    };
                    if (_arg_1.num == 3)
                    {
                        btnXLY.enabled = false;
                    };
                    onSubAnswer(_arg_1.aR);
                };
            };
        }

        private function subApp():void
        {
            _core.remote.call("subQuestionApply", new Responder(onSubApp), null);
        }

        [Bindable(event="propertyChange")]
        public function get answerCvs():Canvas
        {
            return (this._1693501890answerCvs);
        }

        public function __btnXYX_click(_arg_1:MouseEvent):void
        {
            specialItem(_arg_1);
        }

        public function onQuestionFinish():void
        {
            qStr.text = Language.QUESTIONING_PANEL_U[30];
        }

        public function __btnFDJ_click(_arg_1:MouseEvent):void
        {
            specialItem(_arg_1);
        }

        private function _QuestioningPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _QuestioningPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "cName";
            BindingManager.executeBindings(this, "_QuestioningPanel_DataGridColumn1", _QuestioningPanel_DataGridColumn1);
            return (_local_1);
        }

        private function gridClick(_arg_1:ListEvent):void
        {
            var _local_2:Object = _arg_1.itemRenderer.data;
            var _local_3:Number = _local_2.cid;
            var _local_4:String = _local_2.cName;
            var _local_5:Array = [{
                "label":GamePredef.MENU_WISPER,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_P2PWISPER,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_INFO,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_ADDF,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_ADDB,
                "id":_local_3,
                "name":_local_4
            }];
            var _local_6:Menu = CustomMenu.createMenu(null, _local_5);
            _local_6.show((stage.mouseX + 25), ((stage.mouseY > 390) ? 390 : stage.mouseY));
            _local_6.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function viewClick():void
        {
            var initFunc:Function;
            initFunc = function (_arg_1:FlexEvent):void
            {
                viewClear();
                qCvs.visible = true;
                subApp();
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    show();
                    if (!initialized)
                    {
                        addEventListener(FlexEvent.CREATION_COMPLETE, initFunc);
                        return;
                    };
                    initFunc(null);
                };
            };
            Alert.show(Language.QUESTIONING_PANEL_U[6], "", (Alert.YES | Alert.NO), null, func);
        }

        public function set eTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1322604301eTitle;
            if (_local_2 !== _arg_1)
            {
                this._1322604301eTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eTitle", _local_2, _arg_1));
            };
        }

        public function set questionNote(_arg_1:TextArea):void
        {
            var _local_2:Object = this._172294920questionNote;
            if (_local_2 !== _arg_1)
            {
                this._172294920questionNote = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questionNote", _local_2, _arg_1));
            };
        }

        private function _QuestioningPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eTitle.text = _arg_1;
            }, "eTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestioningPanel_BasicTxtButton3.label = _arg_1;
            }, "_QuestioningPanel_BasicTxtButton3.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnXLY.label = _arg_1;
            }, "btnXLY.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFDJ.label = _arg_1;
            }, "btnFDJ.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnXYX.label = _arg_1;
            }, "btnXYX.label");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_XLY);
            }, function (_arg_1:Object):void
            {
                xly1.source = _arg_1;
            }, "xly1.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_XLY);
            }, function (_arg_1:Object):void
            {
                xly2.source = _arg_1;
            }, "xly2.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_XLY);
            }, function (_arg_1:Object):void
            {
                xly3.source = _arg_1;
            }, "xly3.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_FDJ);
            }, function (_arg_1:Object):void
            {
                fdj1.source = _arg_1;
            }, "fdj1.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_FDJ);
            }, function (_arg_1:Object):void
            {
                fdj2.source = _arg_1;
            }, "fdj2.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_FDJ);
            }, function (_arg_1:Object):void
            {
                fdj3.source = _arg_1;
            }, "fdj3.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_XYX);
            }, function (_arg_1:Object):void
            {
                xyx1.source = _arg_1;
            }, "xyx1.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_XYX);
            }, function (_arg_1:Object):void
            {
                xyx2.source = _arg_1;
            }, "xyx2.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ICON_QUESTION_XYX);
            }, function (_arg_1:Object):void
            {
                xyx3.source = _arg_1;
            }, "xyx3.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (questionerArr);
            }, function (_arg_1:Object):void
            {
                questionGrid.dataProvider = _arg_1;
            }, "questionGrid.dataProvider");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestioningPanel_DataGridColumn1.headerText = _arg_1;
            }, "_QuestioningPanel_DataGridColumn1.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestioningPanel_DataGridColumn2.headerText = _arg_1;
            }, "_QuestioningPanel_DataGridColumn2.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestioningPanel_BasicTxtButton5.label = _arg_1;
            }, "_QuestioningPanel_BasicTxtButton5.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestioningPanel_BasicTxtButton7.label = _arg_1;
            }, "_QuestioningPanel_BasicTxtButton7.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QUESTIONING_PANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QuestioningPanel_BasicGlowButton1.label = _arg_1;
            }, "_QuestioningPanel_BasicGlowButton1.label");
            result[19] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable


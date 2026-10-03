// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazeQuestionPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Button;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
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

    public class MazeQuestionPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _totalNum:int = 0;
        private var _rightNum:int = 0;
        private var _1693512424answerNum:RoundedLabel;
        public var _MazeQuestionPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _question:Object;
        public var _MazeQuestionPanel_RoundedLabel1:RoundedLabel;
        public var _MazeQuestionPanel_RoundedLabel3:RoundedLabel;
        private var _1436095542rightNum:RoundedLabel;
        private var _3034469btnA:Button;
        private var _answerNum:int = 0;
        private var _1504147653mazeQuestion:Text;
        private var _3034471btnC:Button;
        private var _3034472btnD:Button;
        private var _3034470btnB:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":350,
                    "height":273,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazeQuestionPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "55";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "height":140,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"mazeQuestion",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "10";
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":300,
                                            "height":120
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazeQuestionPanel_RoundedLabel1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":73,
                                "y":212
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"answerNum",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":143,
                                "y":212
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazeQuestionPanel_RoundedLabel3",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":223,
                                "y":212
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"rightNum",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":293,
                                "y":212
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnA",
                        "events":{"click":"__btnA_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":85,
                                "width":30,
                                "height":20,
                                "y":240,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnB",
                        "events":{"click":"__btnB_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":135,
                                "width":30,
                                "height":20,
                                "y":240,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnC",
                        "events":{"click":"__btnC_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":185,
                                "width":30,
                                "height":20,
                                "y":240,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnD",
                        "events":{"click":"__btnD_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":235,
                                "width":30,
                                "height":20,
                                "y":240,
                                "styleName":"BtnStdRed"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MazeQuestionPanel()
        {
            mx_internal::_document = this;
            this.width = 350;
            this.height = 273;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazeQuestionPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazeQuestionPanel._watcherSetupUtil = _arg_1;
        }


        public function showPanel(_arg_1:Object):void
        {
            this.visible = true;
            if (((!(_arg_1)) || (!(_arg_1.question))))
            {
                return;
            };
            _question = _arg_1.question;
            _answerNum = _arg_1.answerNum;
            _rightNum = _arg_1.rightNum;
            _totalNum = _arg_1.totalNum;
            answerNum.text = Language.MAZE_QUESTION_PANEL_U[6].toString().replace("{num}", _answerNum).replace("{totalnum}", _totalNum);
            rightNum.text = Language.MAZE_QUESTION_PANEL_U[8].toString().replace("{num}", _rightNum);
            var _local_2:int = -1;
            if (!_question[_answerNum])
            {
                return;
            };
            _local_2 = _question[_answerNum];
            var _local_3:Object = GameData.d[GamePredef.TBL_ANSWER][_local_2];
            if (_local_3)
            {
                mazeQuestion.text = Language.MAZE_QUESTION_PANEL_U[9].toString().replace("{question}", _local_3.t).replace("{a}", _local_3.a).replace("{b}", _local_3.b).replace("{c}", _local_3.c).replace("{d}", _local_3.d);
            };
        }

        public function ___MazeQuestionPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __btnA_click(_arg_1:MouseEvent):void
        {
            answer("A");
        }

        override public function initialize():void
        {
            var target:MazeQuestionPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazeQuestionPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazeQuestionPanelWatcherSetupUtil");
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

        public function set mazeQuestion(_arg_1:Text):void
        {
            var _local_2:Object = this._1504147653mazeQuestion;
            if (_local_2 !== _arg_1)
            {
                this._1504147653mazeQuestion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mazeQuestion", _local_2, _arg_1));
            };
        }

        public function set rightNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1436095542rightNum;
            if (_local_2 !== _arg_1)
            {
                this._1436095542rightNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightNum", _local_2, _arg_1));
            };
        }

        public function __btnC_click(_arg_1:MouseEvent):void
        {
            answer("C");
        }

        private function _MazeQuestionPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeQuestionPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazeQuestionPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mazeQuestion.text = _arg_1;
            }, "mazeQuestion.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeQuestionPanel_RoundedLabel1.text = _arg_1;
            }, "_MazeQuestionPanel_RoundedLabel1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                answerNum.text = _arg_1;
            }, "answerNum.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeQuestionPanel_RoundedLabel3.text = _arg_1;
            }, "_MazeQuestionPanel_RoundedLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rightNum.text = _arg_1;
            }, "rightNum.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnA.label = _arg_1;
            }, "btnA.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnB.label = _arg_1;
            }, "btnB.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnC.label = _arg_1;
            }, "btnC.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_QUESTION_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnD.label = _arg_1;
            }, "btnD.label");
            result[9] = binding;
            return (result);
        }

        public function answer(_arg_1:String):void
        {
            if (_answerNum >= _totalNum)
            {
                this.visible = false;
                return;
            };
            var _local_2:int = -1;
            _local_2 = _question[_answerNum];
            var _local_3:Object = GameData.d[GamePredef.TBL_ANSWER][_local_2];
            if (_local_3.r == _arg_1)
            {
                _rightNum++;
            };
            _answerNum++;
            var _local_4:Object = {};
            _local_4.answerNum = _answerNum;
            _local_4.rightNum = _rightNum;
            if (_answerNum >= _totalNum)
            {
                _core.remote.call("answerMazeQuestion", null, _local_4);
                this.visible = false;
                return;
            };
            if (!_question[_answerNum])
            {
                return;
            };
            _local_2 = _question[_answerNum];
            _local_3 = GameData.d[GamePredef.TBL_ANSWER][_local_2];
            if (_local_3)
            {
                mazeQuestion.text = Language.MAZE_QUESTION_PANEL_U[9].toString().replace("{question}", _local_3.t).replace("{a}", _local_3.a).replace("{b}", _local_3.b).replace("{c}", _local_3.c).replace("{d}", _local_3.d);
            };
            answerNum.text = Language.MAZE_QUESTION_PANEL_U[6].toString().replace("{num}", _answerNum).replace("{totalnum}", _totalNum);
            rightNum.text = Language.MAZE_QUESTION_PANEL_U[8].toString().replace("{num}", _rightNum);
            _core.remote.call("answerMazeQuestion", null, _local_4);
        }

        public function set btnC(_arg_1:Button):void
        {
            var _local_2:Object = this._3034471btnC;
            if (_local_2 !== _arg_1)
            {
                this._3034471btnC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnC", _local_2, _arg_1));
            };
        }

        public function __btnB_click(_arg_1:MouseEvent):void
        {
            answer("B");
        }

        public function set answerNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1693512424answerNum;
            if (_local_2 !== _arg_1)
            {
                this._1693512424answerNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "answerNum", _local_2, _arg_1));
            };
        }

        public function __btnD_click(_arg_1:MouseEvent):void
        {
            answer("D");
        }

        public function set btnB(_arg_1:Button):void
        {
            var _local_2:Object = this._3034470btnB;
            if (_local_2 !== _arg_1)
            {
                this._3034470btnB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnB", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
        }

        public function set btnD(_arg_1:Button):void
        {
            var _local_2:Object = this._3034472btnD;
            if (_local_2 !== _arg_1)
            {
                this._3034472btnD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnD", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mazeQuestion():Text
        {
            return (this._1504147653mazeQuestion);
        }

        public function set btnA(_arg_1:Button):void
        {
            var _local_2:Object = this._3034469btnA;
            if (_local_2 !== _arg_1)
            {
                this._3034469btnA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnA", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnA():Button
        {
            return (this._3034469btnA);
        }

        [Bindable(event="propertyChange")]
        public function get btnB():Button
        {
            return (this._3034470btnB);
        }

        private function _MazeQuestionPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_QUESTION_PANEL_U[0];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[9];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[5];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[6];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[7];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[8];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[1];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[2];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[3];
            _local_1 = Language.MAZE_QUESTION_PANEL_U[4];
        }

        [Bindable(event="propertyChange")]
        public function get answerNum():RoundedLabel
        {
            return (this._1693512424answerNum);
        }

        [Bindable(event="propertyChange")]
        public function get btnC():Button
        {
            return (this._3034471btnC);
        }

        [Bindable(event="propertyChange")]
        public function get btnD():Button
        {
            return (this._3034472btnD);
        }

        [Bindable(event="propertyChange")]
        public function get rightNum():RoundedLabel
        {
            return (this._1436095542rightNum);
        }


    }
}//package com.qeedoo.ui.view.compDragable


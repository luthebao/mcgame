// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MailNoticePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import mx.formatters.DateFormatter;
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

    public class MailNoticePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MailNoticePanel_DataGridColumn1:DataGridColumn;
        public var _MailNoticePanel_DataGridColumn2:DataGridColumn;
        private var _3203dg:DataGrid;
        public var _MailNoticePanel_DataGridColumn4:DataGridColumn;
        public var _MailNoticePanel_DataGridColumn3:DataGridColumn;
        public var _MailNoticePanel_DataGridColumn5:DataGridColumn;
        private var _1287834292panelTitle:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":520,
                    "height":350,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":DataGrid,
                        "id":"dg",
                        "stylesFactory":function ():void
                        {
                            this.top = "45";
                            this.left = "20";
                            this.right = "20";
                            this.bottom = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "resizableColumns":false,
                                "draggableColumns":false,
                                "columns":[_MailNoticePanel_DataGridColumn1_i(), _MailNoticePanel_DataGridColumn2_i(), _MailNoticePanel_DataGridColumn3_i(), _MailNoticePanel_DataGridColumn4_i(), _MailNoticePanel_DataGridColumn5_i()]
                            });
                        }
                    })]
                });
            }
        });
        private var _3106ac:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MailNoticePanel()
        {
            mx_internal::_document = this;
            this.width = 520;
            this.height = 350;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MailNoticePanel._watcherSetupUtil = _arg_1;
        }


        private function _MailNoticePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAIL_NOTICE_PANEL_U[0];
            _local_1 = ac;
            _local_1 = Language.MAIL_NOTICE_PANEL_U[1];
            _local_1 = Language.MAIL_NOTICE_PANEL_U[2];
            _local_1 = Language.MAIL_NOTICE_PANEL_U[3];
            _local_1 = Language.MAIL_NOTICE_PANEL_U[4];
            _local_1 = Language.MAIL_NOTICE_PANEL_U[5];
        }

        override public function initialize():void
        {
            var target:MailNoticePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MailNoticePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MailNoticePanelWatcherSetupUtil");
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
        public function get dg():DataGrid
        {
            return (this._3203dg);
        }

        private function _MailNoticePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_NOTICE_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ac);
            }, function (_arg_1:Object):void
            {
                dg.dataProvider = _arg_1;
            }, "dg.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_NOTICE_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailNoticePanel_DataGridColumn1.headerText = _arg_1;
            }, "_MailNoticePanel_DataGridColumn1.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_NOTICE_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailNoticePanel_DataGridColumn2.headerText = _arg_1;
            }, "_MailNoticePanel_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_NOTICE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailNoticePanel_DataGridColumn3.headerText = _arg_1;
            }, "_MailNoticePanel_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_NOTICE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailNoticePanel_DataGridColumn4.headerText = _arg_1;
            }, "_MailNoticePanel_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAIL_NOTICE_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailNoticePanel_DataGridColumn5.headerText = _arg_1;
            }, "_MailNoticePanel_DataGridColumn5.headerText");
            result[6] = binding;
            return (result);
        }

        public function reset():void
        {
            ac.removeAll();
        }

        private function set ac(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._3106ac;
            if (_local_2 !== _arg_1)
            {
                this._3106ac = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ac", _local_2, _arg_1));
            };
        }

        public function set dg(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._3203dg;
            if (_local_2 !== _arg_1)
            {
                this._3203dg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get ac():ArrayCollection
        {
            return (this._3106ac);
        }

        private function _MailNoticePanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailNoticePanel_DataGridColumn1 = _local_1;
            _local_1.width = 70;
            _local_1.dataField = "sn";
            BindingManager.executeBindings(this, "_MailNoticePanel_DataGridColumn1", _MailNoticePanel_DataGridColumn1);
            return (_local_1);
        }

        private function _MailNoticePanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailNoticePanel_DataGridColumn2 = _local_1;
            _local_1.width = 220;
            _local_1.dataField = "subject";
            BindingManager.executeBindings(this, "_MailNoticePanel_DataGridColumn2", _MailNoticePanel_DataGridColumn2);
            return (_local_1);
        }

        private function _MailNoticePanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailNoticePanel_DataGridColumn3 = _local_1;
            _local_1.width = 60;
            _local_1.dataField = "haveItem";
            BindingManager.executeBindings(this, "_MailNoticePanel_DataGridColumn3", _MailNoticePanel_DataGridColumn3);
            return (_local_1);
        }

        private function _MailNoticePanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailNoticePanel_DataGridColumn4 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "charge";
            BindingManager.executeBindings(this, "_MailNoticePanel_DataGridColumn4", _MailNoticePanel_DataGridColumn4);
            return (_local_1);
        }

        private function _MailNoticePanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MailNoticePanel_DataGridColumn5 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "date";
            BindingManager.executeBindings(this, "_MailNoticePanel_DataGridColumn5", _MailNoticePanel_DataGridColumn5);
            return (_local_1);
        }

        public function closeHandler():void
        {
            var _local_4:int;
            var _local_1:Array = [];
            var _local_2:uint;
            while (_local_2 < ac.length)
            {
                if (ac.getItemAt(_local_2).id > 1400000000000)
                {
                    _local_1.push(ac.getItemAt(_local_2));
                };
                _local_2++;
            };
            var _local_3:uint;
            while (_local_3 < _local_1.length)
            {
                _local_4 = ac.getItemIndex(_local_1[_local_3]);
                ac.removeItemAt(_local_4);
                _local_3++;
            };
        }

        public function addMail(_arg_1:Object):void
        {
            var _local_2:Object = new Object();
            _local_2.id = _arg_1.id;
            _local_2.sn = _arg_1.sn;
            _local_2.subject = _arg_1.subject;
            if ((((_arg_1.money > 0) || (_arg_1.gold > 0)) || (_arg_1.itemId > 0)))
            {
                _local_2.haveItem = Language.MAIL_NOTICE_PANEL_S[0];
            }
            else
            {
                _local_2.haveItem = Language.MAIL_NOTICE_PANEL_S[1];
            };
            if (((_arg_1.codMoney > 0) || (_arg_1.codGold > 0)))
            {
                _local_2.charge = Language.MAIL_NOTICE_PANEL_S[2];
            }
            else
            {
                _local_2.charge = Language.MAIL_NOTICE_PANEL_S[3];
            };
            var _local_3:Date = new Date();
            _local_3.setTime(_arg_1.date);
            var _local_4:DateFormatter = new DateFormatter();
            _local_4.formatString = "MM-DD JJ:NN";
            _local_2.date = _local_4.format(_local_3);
            var _local_5:int = -1;
            var _local_6:uint;
            while (_local_6 < ac.length)
            {
                if (ac.getItemAt(_local_6).id == _local_2.id)
                {
                    _local_5 = _local_6;
                    break;
                };
                _local_6++;
            };
            ac.addItemAt(_local_2, 0);
            if (_local_5 != -1)
            {
                ac.removeItemAt((_local_5 + 1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable


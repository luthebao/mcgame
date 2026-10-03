// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.JXHD

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.LinkButton;
    import mx.controls.Button;
    import mx.controls.List;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.controls.Alert;
    import mx.events.ListEvent;
    import com.qeedoo.ui.view.comp.JXHDAwardItem;
    import com.qeedoo.game.utils.TimeUtil;
    import flash.net.Responder;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.LinkEventUtil;
    import mx.core.ClassFactory;
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

    public class JXHD extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _JXHD_BasicTitleCanvas1:BasicTitleCanvas;
        private var _567321895content2:Text;
        public var _JXHD_RoundedLabel4:RoundedLabel;
        private var _1793702779datetime:RoundedLabel;
        private var _1064741693pointnoticeDetailBtn:LinkButton;
        public var _JXHD_RoundedLabel3:RoundedLabel;
        private var _PointNoticeDetailText:*;
        private var _211967513gotobtn:Button;
        private var _nowPanel:*;
        private var _1860721589suitTree:List;
        private var _351979078itemListBox:VBox;
        private var _nowGo:*;
        private var _567321896content1:Text;
        private var _110371416title:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":689,
                    "height":474,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_JXHD_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasJXHD1",
                                "mouseEnabled":false,
                                "percentHeight":100,
                                "percentWidth":100,
                                "y":32,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "x":1,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "500";
                                        this.top = "10";
                                        this.bottom = "16";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"suitTree",
                                                "events":{
                                                    "itemClick":"__suitTree_itemClick",
                                                    "mouseDown":"__suitTree_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                    this.left = "4";
                                                    this.top = "7";
                                                    this.bottom = "4";
                                                    this.right = "4";
                                                    this.selectionColor = 5458828;
                                                    this.rollOverColor = 11775705;
                                                    this.useRollOver = false;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"itemRenderer":_JXHD_ClassFactory1_c()});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasJXHD2",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "height":416,
                                            "y":10,
                                            "width":489,
                                            "x":189,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"title",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 24;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":24,
                                                        "text":"标题"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"datetime",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "30";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":67,
                                                        "text":"时间:"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_JXHD_RoundedLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "30";
                                                    this.fontSize = 12;
                                                    this.fontWeight = "bold";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":95});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_JXHD_RoundedLabel4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "30";
                                                    this.fontSize = 12;
                                                    this.fontWeight = "bold";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":164});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"content1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "44";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":118,
                                                        "text":"内容1",
                                                        "width":418,
                                                        "height":44
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"content2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "44";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":192,
                                                        "text":"内容2",
                                                        "width":418,
                                                        "height":158
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"gotobtn",
                                                "events":{"click":"__gotobtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":358,
                                                        "width":121,
                                                        "height":39,
                                                        "styleName":"BtnJXHDGOTO"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"itemListBox",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "44";
                                                    this.verticalGap = 1;
                                                    this.paddingLeft = 10;
                                                    this.paddingTop = 10;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "y":192,
                                                        "width":418,
                                                        "height":158
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"pointnoticeDetailBtn",
                                                "events":{"click":"__pointnoticeDetailBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":390,
                                                        "y":165,
                                                        "visible":false
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
        private var _3197470hdac:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        private var JXHDCHECKLIST:* = {
            "LimitTimeShop":{
                "lv":"0",
                "r":"Ưu đãi mua sắm",
                "u":"550",
                "n":"Mua sắm ưu đãi",
                "d":"Gói quà giá trị mở bán trong thời gian giới hạn, số lượng có hạn, nhanh tay sở hữu!"
            },
            "xcds":{
                "lv":"50",
                "r":"xcds",
                "u":"989",
                "n":"Đại tiêu trừ",
                "d":"Loại bỏ các khối để giành điểm sự kiện, đổi quà phong phú và cạnh tranh giải thưởng xếp hạng!"
            },
            "mczd":{
                "lv":"35",
                "r":"mczd",
                "u":"996",
                "n":"Đấu pet",
                "d":"Thuần thú thần mạnh mẽ, sắp xếp chiến lược đội hình, đánh bại đối thủ và trở thành bậc thầy đấu trí!"
            },
            "Gailv":{
                "lv":"0",
                "r":"Tăng tỉ lệ giới hạn",
                "u":"-1",
                "n":"Tăng tỉ lệ",
                "d":"Tỷ lệ tăng giới hạn thời gian, cơ hội không thể bỏ lỡ!"
            },
            "Goldman":{
                "lv":"0",
                "r":"Goldman",
                "u":"-1",
                "n":"Thương nhân vàng",
                "d":"Thương nhân vàng đã xuất hiện tại Đông Huyền Thành, mau đến Đông Huyền Thành tìm ông ấy để mua vật phẩm quý hiếm giá rẻ!"
            },
            "MonthWelfare":{
                "lv":"0",
                "r":"Hoàn trả vàng và phần thưởng giá trị",
                "u":"841",
                "n":"Hoàn trả tài chính",
                "d":"Dùng điểm để đầu tư vào các gói tài chính, nhận hoàn trả vàng và phần thưởng phong phú!"
            },
            "SystemShopDiscount":{
                "lv":"0",
                "r":"Bán giảm giá nhiều vật phẩm",
                "u":"550",
                "n":"Giảm giá shop",
                "d":"Nhiều vật phẩm được chọn bán giảm giá tại cửa hàng, hãy nhanh ghé xem!"
            },
            "ConsumeAward":{
                "lv":"0",
                "r":"ConsumeAward",
                "u":"824",
                "n":"Tích lũy tiêu phí",
                "d":"Tiêu vàng và điểm để nhận thưởng thêm phong phú, tiêu càng nhiều thưởng càng lớn, nhanh chóng tiêu phí ngay!"
            },
            "Wawagame":{
                "lv":"0",
                "r":"Wawagame",
                "u":"933",
                "n":"Máy gắp thú",
                "d":"Trải nghiệm cảm giác hồi hộp của máy gắp thú và nhận quà tặng đặc biệt!"
            },
            "PointAward":{
                "lv":"0",
                "r":"PointAward",
                "u":"824",
                "n":"Sự kiện đổi",
                "d":"Đổi một lần đạt đủ số điểm nhất định sẽ nhận được quà tặng tương ứng, nhanh chọn quà theo ý thích của bạn nhé!"
            },
            "ComboShop":{
                "lv":"0",
                "r":"ComboShop",
                "u":"847",
                "n":"Sao lấp lánh",
                "d":"Mua combo quà tặng phổ biến với giá siêu ưu đãi, hãy nhanh chọn gói combo yêu thích nhé!"
            },
            "JewelRemove":{
                "lv":"0",
                "r":"Giảm 30% gỡ bảo thạch",
                "u":"460",
                "n":"Giảm 30% khi gỡ bảo thạch",
                "d":"Trong thời gian diễn ra sự kiện, gỡ bảo thạch sẽ được giảm giá!！"
            },
            "Juhuasuan":{
                "lv":"0",
                "r":"Juhuasuan",
                "u":"938",
                "n":"Đặt hàng",
                "d":"Đặt mua nhiều đặc quyền, nhận quà giới hạn thời gian, mua một lần nhận phúc lợi trong 10 ngày!"
            },
            "Treasurebowl":{
                "lv":"0",
                "r":"Treasurebowl",
                "u":"906",
                "n":"Đoạt bảo hộp",
                "d":"Nhiều sản phẩm giảm giá bán giới hạn, làm mới liên tục với nhiều bất ngờ!"
            },
            "VipShop":{
                "lv":"0",
                "r":"VipShop",
                "u":"855",
                "n":"Shop kim cương",
                "d":"Nhiều gói quà giới hạn thời gian, sản phẩm siêu giá trị với ưu đãi đặc biệt!"
            },
            "Dailysignin":{
                "lv":"0",
                "r":"Phần thưởng hoàn tiền cao, bùng nổ nhiều phần thưởng",
                "u":"967",
                "n":"Điểm danh nhận quà",
                "d":"Đăng nhập mỗi ngày nhận thưởng lớn, nạp đổi nhận hoàn tiền cao!"
            },
            "Happyline":{
                "lv":"0",
                "r":"Happyline",
                "u":"959",
                "n":"Niềm vui kết nối",
                "d":"Thắp sáng các con số, tạo kết nối, nhận nhiều phần thưởng!"
            },
            "PointNotice":{
                "lv":"0",
                "r":"PointNotice",
                "u":"988",
                "n":"Tích lũy nạp",
                "d":"Nạp tích lũy nhận quà giá trị, phần thưởng phong phú chờ bạn nhận!"
            },
            "dmbk":{
                "lv":"0",
                "r":"dmbk",
                "u":"-100",
                "n":"Truy tìm kho báu",
                "d":"Một điều tra viên thần bí xuất hiện tại Hư Không Mạc. Hoàn thành phụ bản giới hạn thời gian “Kho Báu Đại Mạc [Sự kiện] có thể nhận vật phẩm  sự kiện đặc biệt, và đổi thưởng phong phú tại chỗ của điều tra viên."
            },
            "tkyyh":{
                "lv":"50",
                "r":"tkyyh",
                "u":"-1",
                "n":"Lễ hội công viên trên không",
                "d":"Người chơi cấp 50 trở lên có thể lập đội đến Đại Sứ Quảng Bá Hội Vui Chơi tại Tinh Linh Thành để tham gia sự kiện, nhận vé du hội và đổi các vật phẩm yêu thích tại Sứ giả tuyên truyền! (Sau khi sự kiện kết thúc, vé sẽ bị mất, vui lòng đổi thưởng kịp thời trước khi kết thúc)."
            },
            "asi":{
                "lv":"0",
                "r":"asi",
                "u":"1004",
                "n":"Điểm danh kỷ niệm",
                "d":"Trong thời gian sự kiện, điểm danh mỗi ngày có thể nhận phần thưởng, hoàn thành toàn bộ điểm danh sẽ được thêm một Tiểu Tinh Linh mới — Cặp Ma Thuật!"
            }
        };
        private var JXHDICONLIST:* = {
            "LimitTimeShop":{"n":"xianshiqianggou"},
            "xcds":{"n":"xcds"},
            "mczd":{"n":"mczd"},
            "Gailv":{"n":"gailvtisheng"},
            "Goldman":{"n":"jingzishangreng"},
            "MonthWelfare":{"n":"licaifanhuan"},
            "SystemShopDiscount":{"n":"shangdiandazhe"},
            "ConsumeAward":{"n":"xiaofeileiji"},
            "Wawagame":{"n":"wawaji"},
            "PointAward":{"n":"duihuanhuodong"},
            "ComboShop":{"n":"rqzh"},
            "JewelRemove":{"n":"baoshizhaichu"},
            "Juhuasuan":{"n":"srdg"},
            "Treasurebowl":{"n":"jbp"},
            "VipShop":{"n":"zssc"},
            "Dailysignin":{"n":"xsss"},
            "Happyline":{"n":"yxq"},
            "PointNotice":{"n":"czth"},
            "dmbk":{"n":"dmbk"},
            "tkyyh":{"n":"tkyyh"},
            "asi":{"n":"asi"}
        };
        private var goldManAList:* = [2839, 4824, 3961, 3382, 3380, 4822, 4873, 3609, 4030, 3395, 3396, 3397, 3398, 3394, 4991, 4994, 4990, 4993, 4989, 4992, 4919, 4918, 5230, 5231, 5229, 6199, 3900];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function JXHD()
        {
            mx_internal::_document = this;
            this.width = 689;
            this.height = 474;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            JXHD._watcherSetupUtil = _arg_1;
        }


        public function __gotobtn_click(_arg_1:MouseEvent):void
        {
            gotoHandler();
        }

        [Bindable(event="propertyChange")]
        public function get suitTree():List
        {
            return (this._1860721589suitTree);
        }

        public function set datetime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1793702779datetime;
            if (_local_2 !== _arg_1)
            {
                this._1793702779datetime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "datetime", _local_2, _arg_1));
            };
        }

        public function set pointnoticeDetailBtn(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._1064741693pointnoticeDetailBtn;
            if (_local_2 !== _arg_1)
            {
                this._1064741693pointnoticeDetailBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointnoticeDetailBtn", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        private function _JXHD_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JXHD_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _JXHD_BasicTitleCanvas1.text = _arg_1;
            }, "_JXHD_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (hdac);
            }, function (_arg_1:Object):void
            {
                suitTree.dataProvider = _arg_1;
            }, "suitTree.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                title.filters = _arg_1;
            }, "title.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                datetime.filters = _arg_1;
            }, "datetime.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JXHD_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _JXHD_RoundedLabel3.text = _arg_1;
            }, "_JXHD_RoundedLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _JXHD_RoundedLabel3.filters = _arg_1;
            }, "_JXHD_RoundedLabel3.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JXHD_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _JXHD_RoundedLabel4.text = _arg_1;
            }, "_JXHD_RoundedLabel4.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                _JXHD_RoundedLabel4.filters = _arg_1;
            }, "_JXHD_RoundedLabel4.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                content1.filters = _arg_1;
            }, "content1.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                content2.filters = _arg_1;
            }, "content2.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JXHD_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pointnoticeDetailBtn.label = _arg_1;
            }, "pointnoticeDetailBtn.label");
            result[10] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get datetime():RoundedLabel
        {
            return (this._1793702779datetime);
        }

        public function set itemListBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._351979078itemListBox;
            if (_local_2 !== _arg_1)
            {
                this._351979078itemListBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemListBox", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:JXHD;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _JXHD_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_JXHDWatcherSetupUtil");
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
        public function get gotobtn():Button
        {
            return (this._211967513gotobtn);
        }

        public function onGetJXHDAward(_arg_1:*):void
        {
            if ((((!(_arg_1)) || (!(_arg_1[1]))) || (_arg_1[1].length < 1)))
            {
                return;
            };
            var _local_2:* = _arg_1[0];
            if (JXHDICONLIST[_local_2])
            {
                JXHDICONLIST[_local_2].award = _arg_1[1];
            };
        }

        protected function pointnoticeDetailBtn_clickHandler(_arg_1:MouseEvent):void
        {
            Alert.show(_PointNoticeDetailText);
        }

        public function __suitTree_itemClick(_arg_1:ListEvent):void
        {
            list_itemClickHandler();
        }

        private function clearRightContent():void
        {
            title.text = "";
            datetime.text = "";
            content1.text = "";
            content2.text = "";
            itemListBox.visible = false;
            pointnoticeDetailBtn.visible = false;
        }

        public function set content1(_arg_1:Text):void
        {
            var _local_2:Object = this._567321896content1;
            if (_local_2 !== _arg_1)
            {
                this._567321896content1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "content1", _local_2, _arg_1));
            };
        }

        public function set content2(_arg_1:Text):void
        {
            var _local_2:Object = this._567321895content2;
            if (_local_2 !== _arg_1)
            {
                this._567321895content2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "content2", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function set suitTree(_arg_1:List):void
        {
            var _local_2:Object = this._1860721589suitTree;
            if (_local_2 !== _arg_1)
            {
                this._1860721589suitTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitTree", _local_2, _arg_1));
            };
        }

        public function set gotobtn(_arg_1:Button):void
        {
            var _local_2:Object = this._211967513gotobtn;
            if (_local_2 !== _arg_1)
            {
                this._211967513gotobtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gotobtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemListBox():VBox
        {
            return (this._351979078itemListBox);
        }

        private function set hdac(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._3197470hdac;
            if (_local_2 !== _arg_1)
            {
                this._3197470hdac = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hdac", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get hdac():ArrayCollection
        {
            return (this._3197470hdac);
        }

        [Bindable(event="propertyChange")]
        public function get pointnoticeDetailBtn():LinkButton
        {
            return (this._1064741693pointnoticeDetailBtn);
        }

        public function __suitTree_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function setAwardItem(_arg_1:*, _arg_2:*):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:JXHDAwardItem;
            var _local_6:*;
            if (_arg_2.award)
            {
                itemListBox.removeAllChildren();
                _local_3 = _arg_2.award;
                for (_local_4 in _local_3)
                {
                    if (_local_3[_local_4])
                    {
                        _local_5 = new JXHDAwardItem();
                        if (((_local_3[_local_4].list) && (_local_3[_local_4].list.length > 9)))
                        {
                            _local_6 = Math.floor((_local_3[_local_4].list.length / 9));
                            if ((_local_3[_local_4].list.length % 9) > 0)
                            {
                                _local_6 = (_local_6 + 1);
                            };
                            _local_5.height = (_local_5.height + (40 * (_local_6 - 1)));
                        };
                        itemListBox.addChild(_local_5);
                        if (((_local_3[_local_4].list) && (_local_3[_local_4].list.length > 0)))
                        {
                            _local_5.setData(_local_3[_local_4]);
                        };
                    };
                };
            };
        }

        private function list_itemClickHandler(_arg_1:*=null):void
        {
            var _local_2:*;
            clearRightContent();
            if (_arg_1)
            {
                _local_2 = _arg_1;
            }
            else
            {
                _local_2 = suitTree.selectedItem;
            };
            if (!_local_2)
            {
                return;
            };
            title.text = _local_2.n;
            if (_local_2.s > 0)
            {
                datetime.text = Language.JXHD_PANEL[3].replace("{start}", TimeUtil.dateTimeToString(new Date(Number(_local_2.s)))).replace("{end}", TimeUtil.dateTimeToString(new Date(Number(_local_2.e))));
            }
            else
            {
                if (((!(_local_2.icon == "shangdiandazhe")) && (_local_2.e > 0)))
                {
                    datetime.text = Language.JXHD_PANEL[5].replace("{end}", TimeUtil.dateTimeToString(new Date(Number(_local_2.e))));
                }
                else
                {
                    datetime.text = Language.JXHD_PANEL[11];
                };
            };
            if (_local_2.icon == "czth")
            {
                content1.htmlText = _local_2.d;
                pointnoticeDetailBtn.visible = true;
            }
            else
            {
                content1.text = _local_2.d;
            };
            content2.text = "";
            if (_local_2.u > 0)
            {
                _nowPanel = _local_2.u;
                gotobtn.visible = true;
            }
            else
            {
                _nowPanel = -1;
                gotobtn.visible = false;
                _nowGo = _local_2.u;
                if (_nowGo == -100)
                {
                    gotobtn.visible = true;
                };
            };
            switch (_local_2.r)
            {
                case "xcds":
                case "mczd":
                case "Goldman":
                case "ConsumeAward":
                case "Wawagame":
                case "PointAward":
                case "ComboShop":
                case "Juhuasuan":
                case "Treasurebowl":
                case "VipShop":
                case "Happyline":
                case "PointNotice":
                case "dmbk":
                case "tkyyh":
                case "asi":
                    setAwardItem(_local_2.r, JXHDICONLIST[_local_2.r]);
                    itemListBox.visible = true;
                    content2.visible = false;
                    return;
                default:
                    content2.text = _local_2.r;
                    itemListBox.visible = false;
                    content2.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get content1():Text
        {
            return (this._567321896content1);
        }

        [Bindable(event="propertyChange")]
        public function get content2():Text
        {
            return (this._567321895content2);
        }

        override public function initView():void
        {
            _core.remote.call("getJXHDList", new Responder(onGetJXHDList));
        }

        private function genJXHDAward(_arg_1:*):*
        {
            var _local_2:Object;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            switch (String(_arg_1))
            {
                case "xcds":
                    _local_2 = _core.view.getUI(ViewManager.PANEL_XIAOCHUSDASAI_ACTIVITY);
                    if (_local_2)
                    {
                        _local_3 = {};
                        _local_3.title = Language.JXHD_PANEL[6];
                        _local_3.list = [];
                        _local_4 = _local_2.XCDSAwardConfig;
                        _local_5 = 0;
                        while (_local_5 < _local_4.length)
                        {
                            _local_6 = {};
                            _local_6.t = 29;
                            _local_6.n = 1;
                            _local_6.ii = _local_4[_local_5];
                            _local_3.list[_local_5] = _local_6;
                            _local_5++;
                        };
                        JXHDICONLIST[_arg_1].award = [];
                        JXHDICONLIST[_arg_1].award[0] = _local_3;
                    };
                    return;
                case "mczd":
                    _local_2 = _core.view.getUI(ViewManager.PANEL_MCZD_ALL_RANK);
                    if (_local_2)
                    {
                        _local_4 = _local_2.MCZD_ALLRANK_AWARD;
                        JXHDICONLIST[_arg_1].award = [];
                        _local_5 = 0;
                        while (_local_5 < _local_4.length)
                        {
                            _local_7 = 1;
                            while (_local_7 < 7)
                            {
                                if (_local_7 != 5)
                                {
                                    _local_3 = {};
                                    _local_3.title = Language.JXHD_PANEL[7].replace("{re}", _local_2.MCZDRegion_str(_local_5)).replace("{rank}", _local_2.MCZDRank_str(_local_7));
                                    _local_3.list = [];
                                    for (_local_8 in _local_4[_local_5][_local_7])
                                    {
                                        _local_6 = {};
                                        _local_6.t = 29;
                                        _local_6.n = int(_local_4[_local_5][_local_7][_local_8]);
                                        _local_6.ii = int(_local_8);
                                        _local_3.list.push(_local_6);
                                    };
                                    JXHDICONLIST[_arg_1].award.push(_local_3);
                                };
                                _local_7++;
                            };
                            _local_5++;
                        };
                    };
                    return;
                case "Goldman":
                    _local_3 = {};
                    _local_3.title = Language.JXHD_PANEL[8];
                    _local_3.list = [];
                    for (_local_5 in goldManAList)
                    {
                        _local_6 = {};
                        _local_6.t = 29;
                        _local_6.n = -1;
                        _local_6.ii = goldManAList[_local_5];
                        _local_3.list.push(_local_6);
                    };
                    JXHDICONLIST[_arg_1].award = [];
                    JXHDICONLIST[_arg_1].award[0] = _local_3;
                    return;
                case "VipShop":
                    _local_3 = {};
                    _local_3.title = Language.JXHD_PANEL[9];
                    _local_3.list = [];
                    for (_local_5 in GameData.d[GamePredef.TBL_SHOP_SLOT])
                    {
                        if (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_5].sid == 99)
                        {
                            _local_6 = {};
                            _local_6.t = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_5].type;
                            _local_6.n = -1;
                            _local_6.ii = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_5].itemId;
                            _local_3.list.push(_local_6);
                        };
                    };
                    JXHDICONLIST[_arg_1].award = [];
                    JXHDICONLIST[_arg_1].award[0] = _local_3;
                    return;
                case "dmbk":
                    _local_3 = {};
                    _local_3.title = Language.JXHD_PANEL[2];
                    _local_3.list = [];
                    for (_local_5 in GameData.d[GamePredef.TBL_CREDIT])
                    {
                        if (GameData.d[GamePredef.TBL_CREDIT][_local_5].shopId == 8)
                        {
                            _local_6 = {};
                            _local_6.t = GameData.d[GamePredef.TBL_CREDIT][_local_5].type;
                            _local_6.n = -1;
                            _local_6.ii = GameData.d[GamePredef.TBL_CREDIT][_local_5].itemId;
                            _local_3.list.push(_local_6);
                        };
                    };
                    JXHDICONLIST[_arg_1].award = [];
                    JXHDICONLIST[_arg_1].award[0] = _local_3;
                    return;
                case "tkyyh":
                    _local_3 = {};
                    _local_3.title = Language.JXHD_PANEL[2];
                    _local_3.list = [];
                    for (_local_5 in GameData.d[GamePredef.TBL_CREDIT])
                    {
                        if (GameData.d[GamePredef.TBL_CREDIT][_local_5].shopId == 9)
                        {
                            _local_6 = {};
                            _local_6.t = GameData.d[GamePredef.TBL_CREDIT][_local_5].type;
                            _local_6.n = -1;
                            _local_6.ii = GameData.d[GamePredef.TBL_CREDIT][_local_5].itemId;
                            _local_3.list.push(_local_6);
                        };
                    };
                    JXHDICONLIST[_arg_1].award = [];
                    JXHDICONLIST[_arg_1].award[0] = _local_3;
                    return;
                case "asi":
                    _local_2 = _core.view.getUI(ViewManager.PANEL_ANNIVERSARYSIGNIN);
                    if (_local_2)
                    {
                        _local_9 = _local_2.ASI_SIGNIN_AWARD_MAP;
                        _local_3 = {};
                        _local_3.title = "Phần thưởng điểm danh hằng ngày";
                        _local_3.list = [];
                        _local_6 = {};
                        _local_6.t = 29;
                        _local_6.n = _local_9[0].n;
                        _local_6.ii = _local_9[0].i;
                        _local_3.list.push(_local_6);
                        JXHDICONLIST[_arg_1].award = [];
                        JXHDICONLIST[_arg_1].award[0] = _local_3;
                        _local_10 = {};
                        _local_10.title = "Phần thưởng hoàn thành toàn bộ điểm danh";
                        _local_10.list = [];
                        _local_11 = {};
                        _local_11.t = 29;
                        _local_11.n = 1;
                        _local_11.ii = _local_2.ASI_SIGNIN_BIGAWARD;
                        _local_10.list.push(_local_11);
                        JXHDICONLIST[_arg_1].award[1] = _local_10;
                    };
                    return;
                case "ConsumeAward":
                case "Wawagame":
                case "PointAward":
                case "ComboShop":
                case "Juhuasuan":
                case "Treasurebowl":
                case "Happyline":
                case "PointNotice":
                    _core.remote.call("getJXHDAward", new Responder(onGetJXHDAward), _arg_1);
                    return;
            };
        }

        private function gotoHandler():void
        {
            var _local_1:Object;
            if (_nowPanel > 0)
            {
                switch (_nowPanel)
                {
                    case ViewManager.PANEL_SYSTEM_SHOP:
                        _core.view.changeVisible(ViewManager.PANEL_SYSTEM_SHOP);
                        break;
                    case ViewManager.PANEL_XIAOCHUSDASAI_ACTIVITY:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_XIAOCHUSDASAI_ACTIVITY);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                    case ViewManager.PANEL_MCZD:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_MCZD);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                    case ViewManager.PANEL_WELFARE:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_WELFARE);
                        if (((_local_1) && (_local_1.isInited)))
                        {
                            _local_1.init();
                            _local_1.visible = true;
                        }
                        else
                        {
                            _core.view.show(ViewManager.PANEL_WELFARE);
                        };
                        break;
                    case ViewManager.PANEL_GAMEINTRO:
                        _core.view.getUI(ViewManager.PANEL_GAMEINTRO).visible = true;
                        break;
                    case ViewManager.PANEL_SENDCOMBINE:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_SENDCOMBINE);
                        if (_local_1)
                        {
                            _local_1.init();
                            _local_1.visible = true;
                        };
                        break;
                    case ViewManager.PANEL_EQUIPTFUNC:
                        if (!_core.battleServer.inBattleServer)
                        {
                            _core.view.changeVisible(ViewManager.PANEL_EQUIPTFUNC);
                        };
                        break;
                    case ViewManager.PANEL_JUHUASUAN:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_JUHUASUAN);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                    case ViewManager.PANEL_TREASURE_BOWL:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_TREASURE_BOWL);
                        if (_local_1)
                        {
                            _local_1.initTreasurePanel();
                        };
                        break;
                    case ViewManager.PANEL_VIP_SHOP:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_VIP_SHOP);
                        if (_local_1)
                        {
                            _local_1.initPanel();
                            _local_1.visible = true;
                        };
                        break;
                    case ViewManager.PANEL_DAILYSIGNINACT:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_DAILYSIGNINACT);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                    case ViewManager.PANEL_HAPPYFRONTLINE:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_HAPPYFRONTLINE);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                    case ViewManager.PANEL_CONSUME_NOTICE_ACTIVITY:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_CONSUME_NOTICE_ACTIVITY);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                    case ViewManager.PANEL_WAWA_GAME:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_WAWA_GAME);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                    case ViewManager.PANEL_ANNIVERSARYSIGNIN:
                        _local_1 = _core.view.getUI(ViewManager.PANEL_ANNIVERSARYSIGNIN);
                        if (_local_1)
                        {
                            _local_1.showPanel();
                        };
                        break;
                };
            }
            else
            {
                if (_nowGo == -100)
                {
                    LinkEventUtil.linkTextHandler("L_N|2596", null);
                };
            };
        }

        private function _JXHD_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = JXHD_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _JXHD_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.JXHD_PANEL[0];
            _local_1 = hdac;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.JXHD_PANEL[1];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.JXHD_PANEL[2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.JXHD_PANEL[10];
        }

        public function __pointnoticeDetailBtn_click(_arg_1:MouseEvent):void
        {
            pointnoticeDetailBtn_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get title():RoundedLabel
        {
            return (this._110371416title);
        }

        public function onGetJXHDList(_arg_1:*):void
        {
            var _local_4:*;
            var _local_5:*;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Number = (new Date().getTime() + 86400000);
            if (((hdac) && (hdac.length > 0)))
            {
                hdac.removeAll();
            };
            var _local_3:* = 0;
            for (_local_4 in _arg_1)
            {
                if (JXHDCHECKLIST[_local_4])
                {
                    if (int(_core.player.level) >= int(JXHDCHECKLIST[_local_4].lv))
                    {
                        _local_5 = {};
                        _local_5.n = JXHDCHECKLIST[_local_4].n;
                        _local_5.d = JXHDCHECKLIST[_local_4].d;
                        if (((_local_4 == "PointNotice") && (_arg_1[_local_4].text)))
                        {
                            _local_5.d = _arg_1[_local_4].text;
                            _PointNoticeDetailText = _arg_1[_local_4].text2;
                        };
                        _local_5.s = _arg_1[_local_4].startTime;
                        _local_5.e = _arg_1[_local_4].endTime;
                        _local_5.icon = JXHDICONLIST[_local_4].n;
                        _local_5.u = int(JXHDCHECKLIST[_local_4].u);
                        _local_5.r = JXHDCHECKLIST[_local_4].r;
                        if (((_local_4 == "Gailv") && (_arg_1[_local_4].notice)))
                        {
                            _local_5.r = _arg_1[_local_4].notice.replace("<font color='#00FF00'>", "").replace("</font>", "");
                        };
                        if (((_local_2 > _local_5.e) && (!(_local_4 == "SystemShopDiscount"))))
                        {
                            _local_5.c = true;
                        }
                        else
                        {
                            _local_5.c = false;
                        };
                        if (!JXHDICONLIST[_local_4].award)
                        {
                            genJXHDAward(_local_4);
                        };
                        hdac.addItem(_local_5);
                        _local_3++;
                    };
                };
            };
            if (_local_3 > 0)
            {
                list_itemClickHandler(hdac.getItemAt(0));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable


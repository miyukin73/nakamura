# -*- coding: utf-8 -*-
import sys

import radio
#import lora_recv


def main(argc, argv):
    lora_device = "/dev/ttySOFT0"  # ES920LRデバイス名
    if argc < 2:
        print('Usage: python %s send' % (argv[0]))
        #print('       [send | recv] ... mode select')
        sys.exit()
    if argv[1] != 'send': #and argv[1] != 'recv':
        print('Usage: python %s send' % (argv[0]))
        #print('       [send | recv] ... mode select')
        sys.exit()
    """
    if argc < 2:
        print('Usage: python %s [send | recv]' % (argv[0]))
        print('       [send | recv] ... mode select')
        sys.exit()
    if argv[1] != 'send' and argv[1] != 'recv':
        print('Usage: python %s [send | recv]' % (argv[0]))
        print('       [send | recv] ... mode select')
        sys.exit()
        """

    # チャンネル番号を入力
    channel = input('channel:')

    # 送信側の場合
    if argv[1] == 'send':
        lr_send = radio.radio(lora_device, channel)
        lr_send.sendData()
        """
    # 受信側の場合
    elif argv[1] == 'recv':
        lr_recv = lora_recv.LoraRecvClass(lora_device, channel)
        lr_recv.lora_recv()
        """


if __name__ == '__main__':
    main(len(sys.argv), sys.argv)
    sys.exit()